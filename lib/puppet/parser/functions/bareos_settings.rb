# frozen_string_literal: true

require 'resolv'

module Puppet::Parser::Functions
  newfunction(:bareos_settings, type: :rvalue, doc: <<-'ENDHEREDOC') do |args|
    Helper function to parse settings for bareos and return prepared lines for config file
  ENDHEREDOC

    final_settings = []
    args.each do |setting|
      raise 'Invalid or incomplete setting' unless setting.length > 2 && setting.is_a?(Array)

      value_setting = setting[0] # value for this setting
      directive = setting[1] # Directive Keyword of this setting
      dirty_type = setting[2] # bareos variable type
      required = setting[3] # boolean, undef allowed or not
      indent = setting[4] || '  ' # Internally used, just for beatufying

      raise 'Name of directive config key is invalid' unless directive =~ %r{^[a-zA-Z0-9 ]+$}

      # check array if allowed
      values = if (%w[acl runscript runscript_short].include?(dirty_type) || dirty_type =~ %r{[_-]list$} || dirty_type =~ %r{[_-]nested$}) && value_setting.is_a?(Array)
                 value_setting
               else
                 [value_setting]
               end
      type = dirty_type.gsub(%r{[_-]list$}, '')

      values.each do |value|
        # ignore undef if not required
        next if required == false && (value.nil? || value == :undef)
        raise 'This directive is required, please set value' if value.nil? || value == :undef

        # defaults:
        # quote value
        quote = false
        # check regex
        regex = nil
        # check in array
        value_in_array = nil
        # required for addresses/hashes
        hash_separator = ' '

        # validation by type
        case type
        # maybe check more than it is an int
        when 'int32', 'pint16', 'pint32', 'port', 'max_blocksize'
          # type casting raise error
          Integer(value)
        when 'name', 'res', 'resource'
          quote = true
          regex = %r{^[a-z][a-z0-9.\-_ $]{0,126}$}i
        when 'acl', 'messages', 'type', 'string_noquote', 'schedule_run_command'
          raise 'Value need to be an string' unless value.is_a?(String)
        # type md5password is missleading, it is an plain password and not md5 hashed
        when 'audit_command', 'runscript_short', 'autopassword', 'md5password', 'directory', 'string', 'strname', 'device', 'plugin_names'
          # array
          quote = true
          raise 'Value need to be an string' unless value.is_a?(String)
        when 'speed'
          regex = %r{^\d+\W*(k|kb|m|mb)/s$}i
        when 'size64'
          regex = %r{^(\d+(\.\d+)?)\W*(k|kb|m|mb|g|gb)$}i
        when 'time'
          regex = %r{^(\d+|(\d+\W+(seconds|sec|s|minutes|min|hours|h|days|d|weeks|w|months|m|quarters|q|years|y)\W*)+)$}i
        when 'boolean', 'bit'
          value_in_array = %w[yes no on off true false]
        when 'address'
          raise 'Value need to be an string' unless value.is_a?(String)

          # validate net-address for domain name or ip
          regex_hostname = %r{^(([a-zA-Z0-9]|[a-zA-Z0-9][a-zA-Z0-9\-]*[a-zA-Z0-9])\.)*([A-Za-z0-9]|[A-Za-z0-9][A-Za-z0-9\-]*[A-Za-z0-9])$}i
          raise 'Value needs to be an ip or host address' unless value =~ Resolv::IPv4::Regex || value =~ Resolv::IPv6::Regex || value =~ Regexp.compile(regex_hostname)
        when 'addresses'
          hash_separator = ' = '
          raise 'Please specify as Hash' unless value.is_a?(Hash)
        when 'include_exclude_item', 'runscript', 'hash'
          raise 'Please specify as Hash' unless value.is_a?(Hash)
        when 'include_exclude_item_nested'
          raise 'Nested elements need to be hashes or strings' unless value.is_a?(Hash) || value.is_a?(String)
        when 'backup_level'
          value_in_array = %w[full incremental differential virtualfull initcatalog catalog volumetocatalog disktocatalog]
        when 'io_direction'
          value_in_array = %w[in out both]
        when 'action_on_purge'
          value_in_array = %w[truncate]
        when 'encryption_cipher'
          value_in_array = %w[aes128 aes192 aes256 camellia128 camellia192 camellia256 aes128hmacsha1 aes256hmacsha1 blowfish]
        when 'auth_type'
          value_in_array = %w[clear md5]
        when 'auth_protocol_type', 'protocol_type'
          value_in_array = %w[native ndmp]
        when 'pooltype'
          value_in_array = %w[backup archive cloned migration copy save scratch]
        when 'label'
          value_in_array = %w[ansi ibm bareos]
        when 'migration_type'
          value_in_array = %w[smallestvolume oldestvolume client volume job sqlquery pooloccupancy pooltime pooluncopiedjobs]
        when 'job_type'
          value_in_array = %w[backup restore verify admin migrate copy consolidate]
        when 'replace_option'
          value_in_array = %w[always ifnewer ifolder never]
        when 'device_type'
          value_in_array = %w[tape file fifo gfapi rados]
        when 'compression_algorithm'
          value_in_array = %w[gzip lzo lzfast lz4 lz4hc]
        else
          raise "Invalid setting type '#{type}'"
        end

        # rubocop:disable Style/SoleNestedConditional
        unless value_in_array.nil?
          raise "Value '#{value}' needs to be one of #{value_in_array.inspect}" unless value_in_array.include? value.to_s.downcase
        end
        unless regex.nil?
          raise "Value '#{value}' does not match regex #{regex}" unless value =~ Regexp.compile(regex)
        end
        # rubocop:enable Style/SoleNestedConditional

        if value.is_a?(Hash)
          final_settings.push "#{indent}#{directive}#{hash_separator}{"
          value.each do |k, v|
            # Remove our little validation wrapper
            type = type.gsub(%r{[_-]nested$}, '')
            type_n = 'string_noquote'
            type_n = "#{type_n}_list" if v.is_a?(Array)
            # if we can have multiple hash elements of the same type, e.g. include/exclude/options with fileset
            type_n = "#{type}_nested" if v.is_a?(Array) && %w[include_exclude_item].include?(type)
            # use same type again:
            type_n = type if v.is_a?(Hash)
            final_settings.push function_bareos_settings([[v, k, type_n, false, "#{indent}  "]])
          end
          final_settings.push "#{indent}}"
        else
          if quote
            # value = value.gsub(/(")/, '\"')
            value = "\"#{value}\""
          end
          final_settings.push "#{indent}#{directive} = #{value}"
        end
      end
    rescue StandardError => e
      raise Puppet::ParseError, "bareos_settings(): #{setting.inspect}: #{e}."
    end
    return final_settings.join "\n"
  end
end
