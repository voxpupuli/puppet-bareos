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
        # required for addresses/hashes
        hash_separator = ' '

        # validation by type
        case type
        # maybe check more than it is an int
        when 'name', 'res', 'resource', 'audit_command', 'runscript_short', 'autopassword', 'md5password', 'directory', 'string', 'strname', 'device', 'plugin_names'
          quote = true
        when 'addresses'
          hash_separator = ' = '
        end

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
