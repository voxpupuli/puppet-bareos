require 'spec_helper'
indent_default = '  '

describe 'bareos_settings' do
  context 'type is an integer' do
    %w[int32 pint16 pint32 port max_blocksize].each do |type|
      it 'runs with compatible values' do
        [0, 1, 3849, 222, '2'].each do |val|
          is_expected.to run.with_params([val, 'Test', type, true]).and_return("#{indent_default}Test = #{val}")
        end
      end
      it 'not runs with incompatible values' do
        ['string', { 'hash' => 'val' }].each do |val|
          is_expected.not_to run.with_params([val, 'Test', type, true])
        end
      end
    end
  end

  context 'type is a resource name' do
    %w[name res resource].each do |type|
      it 'runs with compatible values and is quoted' do
        ['This is an string', 'combatible Res_Name-7.9', 'a' * 127].each do |val|
          is_expected.to run.with_params([val, 'Test', type, true]).and_return("#{indent_default}Test = \"#{val}\"")
        end
      end
      it 'not runs with incompatible values' do
        ['0 number start', ' space', '.point', 'a' * 128].each do |val|
          is_expected.not_to run.with_params([val, 'Test', type, true])
        end
      end
    end
  end

  context 'type is a string without quotes' do
    %w[acl messages type string_noquote schedule_run_command].each do |type|
      it 'runs with compatible values' do
        ['Not a number', 'MyString', '23 free usage of Text.!', 'Special ".-,= Chars'].each do |val|
          is_expected.to run.with_params([val, 'Test', type, true]).and_return("#{indent_default}Test = #{val}")
        end
      end
      it 'not runs with incompatible values' do
        [0, -1, 2, { 'hash' => 'val' }].each do |val|
          is_expected.not_to run.with_params([val, 'Test', type, true])
        end
      end
    end
  end

  context 'type is a string with quotes' do
    %w[audit_command runscript_short autopassword md5password directory string strname device plugin_names].each do |type|
      it 'runs with compatible values' do
        ['Not a number', 'MyString', '23 free usage of Text.!', 'Special ".-,= Chars'].each do |val|
          is_expected.to run.with_params([val, 'Test', type, true]).and_return("#{indent_default}Test = \"#{val}\"")
        end
      end
      it 'not runs with incompatible values' do
        [0, -1, 2, { 'hash' => 'val' }, %w[array of string]].each do |val|
          is_expected.not_to run.with_params([val, 'Test', type, true])
        end
      end
    end
  end

  context 'type is speed' do
    %w[speed].each do |type|
      it 'runs with compatible values' do
        ['0 k/s', '49Kb/s', '1 m/s', '200MB/s'].each do |val|
          is_expected.to run.with_params([val, 'Test', type, true]).and_return("#{indent_default}Test = #{val}")
        end
      end
      it 'not runs with incompatible values' do
        ['M', 50, 'k/s', '', ' '].each do |val|
          is_expected.not_to run.with_params([val, 'Test', type, true])
        end
      end
    end
  end

  context 'type is size' do
    %w[size64].each do |type|
      it 'runs with compatible values' do
        ['6k', '400 KB', '5083 m', '100g', '10 GB'].each do |val|
          is_expected.to run.with_params([val, 'Test', type, true]).and_return("#{indent_default}Test = #{val}")
        end
      end
      it 'not runs with incompatible values' do
        ['M', 50, 'GB', '', ' '].each do |val|
          is_expected.not_to run.with_params([val, 'Test', type, true])
        end
      end
    end
  end

  # add time

  context 'type is boolean' do
    %w[boolean bit].each do |type|
      it 'runs with compatible values' do
        ['yes', 'NO', 'on', 'OFF', 'TRUE', 'false', true, false].each do |val|
          is_expected.to run.with_params([val, 'Test', type, true]).and_return("#{indent_default}Test = #{val}")
        end
      end
      it 'not runs with incompatible values' do
        [0, 1, 'true s', 'false s'].each do |val|
          is_expected.not_to run.with_params([val, 'Test', type, true])
        end
      end
    end
  end

  context 'type is a address' do
    %w[address].each do |type|
      it 'runs with compatible values' do
        ['10.0.0.1', '88.120.0.4', '2001:22::f4', 'fd00:0000:0000:0000::1', 'fancy.domain.com', 'my.host.name.de'].each do |val|
          is_expected.to run.with_params([val, 'Test', type, true]).and_return("#{indent_default}Test = #{val}")
        end
      end
      it 'not runs with incompatible values' do
        [0, true, { 'hash' => 'val' }, 'ff01::1::2', 'my domain com', ' invalid,char.com'].each do |val|
          is_expected.not_to run.with_params([val, 'Test', type, true])
        end
      end
    end
  end

  context 'type is an hashed addresses value' do
    %w[addresses].each do |type|
      it 'runs with compatible values' do
        val = {
          'ip' => {
            'addr' => '1.2.3.4',
            'port' => '1205'
          }
        }
        result = "#{indent_default}Test = {
#{indent_default}#{indent_default}ip = {
#{indent_default}#{indent_default}#{indent_default}addr = 1.2.3.4
#{indent_default}#{indent_default}#{indent_default}port = 1205
#{indent_default}#{indent_default}}
#{indent_default}}"
        is_expected.to run.with_params([val, 'Test', type, true]).and_return(result)
      end
      it 'not runs with incompatible values' do
        ['wrong', 222, ['array'], false, true].each do |val|
          is_expected.not_to run.with_params([val, 'Test', type, true])
        end
      end
    end
  end

  context 'type is an hashed value' do
    %w[include_exclude_item runscript hash].each do |type|
      it 'runs with compatible values' do
        val = {
          'My Directive' => 'content',
          'Array'        => %w[a1 b2],
          'Second Hash'  => {
            'Res'        => 'Val'
          }
        }
        result = "#{indent_default}Test {
#{indent_default}#{indent_default}My Directive = content
#{indent_default}#{indent_default}Array = a1
#{indent_default}#{indent_default}Array = b2
#{indent_default}#{indent_default}Second Hash {
#{indent_default}#{indent_default}#{indent_default}Res = Val
#{indent_default}#{indent_default}}
#{indent_default}}"
        is_expected.to run.with_params([val, 'Test', type, true]).and_return(result)
      end
      it 'not runs with incompatible values' do
        ['wrong', 222, ['array'], false, true].each do |val|
          is_expected.not_to run.with_params([val, 'Test', type, true])
        end
      end
    end
  end

  context 'type is backup_level' do
    %w[backup_level].each do |type|
      it 'runs with compatible values' do
        %w[Full incremental differential VirtualFull].each do |val|
          is_expected.to run.with_params([val, 'Test', type, true]).and_return("#{indent_default}Test = #{val}")
        end
      end
      it 'not runs with incompatible values' do
        ['wrong', 'fully', ' Full'].each do |val|
          is_expected.not_to run.with_params([val, 'Test', type, true])
        end
      end
    end
  end

  context 'type is io_direction' do
    %w[io_direction].each do |type|
      it 'runs with compatible values' do
        %w[in out BOTH].each do |val|
          is_expected.to run.with_params([val, 'Test', type, true]).and_return("#{indent_default}Test = #{val}")
        end
      end
      it 'not runs with incompatible values' do
        ['wrong', ' in'].each do |val|
          is_expected.not_to run.with_params([val, 'Test', type, true])
        end
      end
    end
  end

  context 'type is action_on_purge' do
    %w[action_on_purge].each do |type|
      it 'runs with compatible values' do
        %w[truncate Truncate].each do |val|
          is_expected.to run.with_params([val, 'Test', type, true]).and_return("#{indent_default}Test = #{val}")
        end
      end
      it 'not runs with incompatible values' do
        ['wrong', ' truncate'].each do |val|
          is_expected.not_to run.with_params([val, 'Test', type, true])
        end
      end
    end
  end

  context 'type is encryption_cipher' do
    %w[encryption_cipher].each do |type|
      it 'runs with compatible values' do
        %w[aes128 AES192 aes256 camellia128 camellia192 camellia256 aes128hmacsha1 aes256hmacsha1 blowfish].each do |val|
          is_expected.to run.with_params([val, 'Test', type, true]).and_return("#{indent_default}Test = #{val}")
        end
      end
      it 'not runs with incompatible values' do
        ['wrong', ' aes'].each do |val|
          is_expected.not_to run.with_params([val, 'Test', type, true])
        end
      end
    end
  end

  context 'type is auth_type' do
    %w[auth_type].each do |type|
      it 'runs with compatible values' do
        %w[clear MD5].each do |val|
          is_expected.to run.with_params([val, 'Test', type, true]).and_return("#{indent_default}Test = #{val}")
        end
      end
      it 'not runs with incompatible values' do
        ['wrong', ' clear'].each do |val|
          is_expected.not_to run.with_params([val, 'Test', type, true])
        end
      end
    end
  end

  context 'type is auth_protocol_type' do
    %w[auth_protocol_type].each do |type|
      it 'runs with compatible values' do
        %w[native NDMP].each do |val|
          is_expected.to run.with_params([val, 'Test', type, true]).and_return("#{indent_default}Test = #{val}")
        end
      end
      it 'not runs with incompatible values' do
        ['wrong', ' ndmp'].each do |val|
          is_expected.not_to run.with_params([val, 'Test', type, true])
        end
      end
    end
  end

  context 'type is pooltype' do
    %w[pooltype].each do |type|
      it 'runs with compatible values' do
        %w[backup ARCHIVE cloned migration copy save scratch].each do |val|
          is_expected.to run.with_params([val, 'Test', type, true]).and_return("#{indent_default}Test = #{val}")
        end
      end
      it 'not runs with incompatible values' do
        ['wrong', ' backup'].each do |val|
          is_expected.not_to run.with_params([val, 'Test', type, true])
        end
      end
    end
  end

  context 'type is label' do
    %w[label].each do |type|
      it 'runs with compatible values' do
        %w[ansi IBM bareos].each do |val|
          is_expected.to run.with_params([val, 'Test', type, true]).and_return("#{indent_default}Test = #{val}")
        end
      end
      it 'not runs with incompatible values' do
        ['wrong', ' bareos'].each do |val|
          is_expected.not_to run.with_params([val, 'Test', type, true])
        end
      end
    end
  end

  context 'type is migration_type' do
    %w[migration_type].each do |type|
      it 'runs with compatible values' do
        %w[smallestvolume oldestvolume client volume Job sqlquery pooloccupancy pooltime pooluncopiedjobs].each do |val|
          is_expected.to run.with_params([val, 'Test', type, true]).and_return("#{indent_default}Test = #{val}")
        end
      end
      it 'not runs with incompatible values' do
        ['wrong', ' JOB'].each do |val|
          is_expected.not_to run.with_params([val, 'Test', type, true])
        end
      end
    end
  end

  context 'type is job_type' do
    %w[job_type].each do |type|
      it 'runs with compatible values' do
        %w[backup restore verify ADMIN migrate copy consolidate].each do |val|
          is_expected.to run.with_params([val, 'Test', type, true]).and_return("#{indent_default}Test = #{val}")
        end
      end
      it 'not runs with incompatible values' do
        ['wrong', ' backup'].each do |val|
          is_expected.not_to run.with_params([val, 'Test', type, true])
        end
      end
    end
  end

  context 'type is replace_option' do
    %w[replace_option].each do |type|
      it 'runs with compatible values' do
        %w[Always ifnewer ifolder never].each do |val|
          is_expected.to run.with_params([val, 'Test', type, true]).and_return("#{indent_default}Test = #{val}")
        end
      end
      it 'not runs with incompatible values' do
        ['wrong', ' never'].each do |val|
          is_expected.not_to run.with_params([val, 'Test', type, true])
        end
      end
    end
  end

  context 'type is device_type' do
    %w[device_type].each do |type|
      it 'runs with compatible values' do
        %w[TAPE file fifo gfapi rados].each do |val|
          is_expected.to run.with_params([val, 'Test', type, true]).and_return("#{indent_default}Test = #{val}")
        end
      end
      it 'not runs with incompatible values' do
        ['wrong', ' File'].each do |val|
          is_expected.not_to run.with_params([val, 'Test', type, true])
        end
      end
    end
  end

  context 'type is compression_algorithm' do
    %w[compression_algorithm].each do |type|
      it 'runs with compatible values' do
        %w[GZIP LZO lzfast lz4 lz4hc].each do |val|
          is_expected.to run.with_params([val, 'Test', type, true]).and_return("#{indent_default}Test = #{val}")
        end
      end
      it 'not runs with incompatible values' do
        ['wrong', ' gzip'].each do |val|
          is_expected.not_to run.with_params([val, 'Test', type, true])
        end
      end
    end
  end

  context 'type is not compatible' do
    %w[invalid doesNotExist really_not_exists].each do |type|
      it 'raise error' do
        is_expected.to run.with_params([1, 'Test', type, true]).and_raise_error(Puppet::ParseError, %r{Invalid setting type})
      end
    end
  end

  context 'value can be an array' do
    it 'any type with _list suffix' do
      val = %w[first second]
      result = "#{indent_default}Test = first
#{indent_default}Test = second"
      is_expected.to run.with_params([val, 'Test', 'string_noquote_list', true]).and_return(result)
    end

    it 'type is acl' do
      val = %w[first second]
      result = "#{indent_default}Test = first
#{indent_default}Test = second"
      is_expected.to run.with_params([val, 'Test', 'acl', true]).and_return(result)
    end

    it 'type is runcsript' do
      val = [
        { 'Test A' => 'value' },
        { 'Test B' => 'value' }
      ]
      result = "#{indent_default}Test {
#{indent_default}#{indent_default}Test A = value
#{indent_default}}
#{indent_default}Test {
#{indent_default}#{indent_default}Test B = value
#{indent_default}}"
      is_expected.to run.with_params([val, 'Test', 'runscript', true]).and_return(result)
    end
  end
end
