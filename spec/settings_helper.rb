# frozen_string_literal: true

# Provide some generic helper to test classes/defines for bareos
require 'spec_helper'

# This simplifies the generic build of the bareos template config checks
class BareosResourceHelper
  attr_reader :config, :resource

  def initialize(resource)
    @resource = resource
    @config = {}
  end

  # return params for let
  # attr name, directive name and bareos type
  def param(attr, directive, type)
    result = nil
    val = 'not set'
    sep = ' = '
    type.gsub!(%r{([_-]list)$}, '')

    case type
    # short hack to have simple res names
    when 'name', 'res', 'resource'
      val = 'name'
      result = '"name"'
    # maybe check more than it is an int
    when 'int32', 'pint16', 'pint32', 'port', 'max_blocksize'
      val = 42
    when 'audit_command', 'runscript_short', 'autopassword', 'md5password', 'directory', 'string', 'strname', 'device', 'plugin_names'
      val = 'Example Value'
      result = '"Example Value"'
    when 'acl', 'messages', 'type', 'string_noquote', 'schedule_run_command'
      val = 'Long text without direct "quotes'
    when 'speed'
      val = '1337 MB/s'
    when 'size64'
      val = '1337 MB'
    when 'time'
      val = '1337 sec'
    when 'boolean', 'bit'
      val = false
    when 'address'
      val = 'host.name.com'
    when 'addresses', 'include_exclude_item', 'runscript', 'hash'
      sep = ' ' unless type == 'addresses'
      val = {
        'x' => 'y'
      }
      result = '{
    x = y
  }'
    when 'backup_level'
      val = 'full'
    when 'io_direction'
      val = 'in'
    when 'action_on_purge'
      val = 'truncate'
    when 'encryption_cipher'
      val = 'aes192'
    when 'auth_type'
      val = 'clear'
    when 'auth_protocol_type', 'protocol_type'
      val = 'native'
    when 'pooltype' || 'job_type'
      val = 'backup'
    when 'label'
      val = 'ANSI'
    when 'migration_type'
      val = 'job'
    when 'replace_option'
      val = 'always'
    when 'device_type'
      val = 'file'
    when 'compression_algorithm'
      val = 'gzip'
    else
      raise "Missing setting type '#{type}'"
    end

    @config[attr] = {
      'dir' => directive,
      'type' => type,
      'val' => val,
      'res' => result.nil? ? val : result,
      'sep' => sep
    }

    self
  end

  # set custom value
  def param_val(attr, val, res)
    @config[attr]['val'] = val
    @config[attr]['res'] = res
    self
  end

  # get params for :let
  def params
    tmp = {}
    @config.each do |k, v|
      tmp[k] = v['val']
    end
    tmp
  end

  # build content to compare with created file
  def content
    tmp = "# This file is managed by puppet\n#{@resource} {\n"
    @config.each do |_, v|
      tmp = "#{tmp}  #{v['dir']}#{v['sep']}#{v['res']}\n"
    end
    "#{tmp}}\n"
  end
end
