require 'spec_helper'

describe 'bareos::director::catalog' do
  let(:title) { 'name' }

  filename = '/etc/bareos/bareos-dir.d/catalog/name.conf'

  context 'with default values for all parameters will fail' do
    it { is_expected.to compile.and_raise_error(%r{.*}) }
  end

  context 'with required values' do
    let(:params) do
      {
        'db_driver' => 'mysql',
        'db_name'   => 'catalogdb'
      }
    end

    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_class('bareos::director') }
    it { is_expected.to contain_file(filename).with_content(%r{^Catalog \{$}) }
    it { is_expected.to contain_file(filename).with_content(%r{Name = "name"$}) }
    it { is_expected.to contain_file(filename).with_tag(['bareos', 'bareos_director']) }
  end

  context 'with all params set' do
    res = BareosResourceHelper.new('Catalog')
    res.param('name', 'Name', 'name').
      param('description', 'Description', 'string').
      param('db_address', 'Db Address', 'string').
      param('db_driver', 'Db Driver', 'string').
      param('db_name', 'Db Name', 'string').
      param('db_password', 'Db Password', 'autopassword').
      param('db_port', 'Db Port', 'pint32').
      param('db_socket', 'Db Socket', 'string').
      param('db_user', 'Db User', 'string').
      param('disable_batch_insert', 'Disable Batch Insert', 'boolean').
      param('exit_on_fatal', 'Exit On Fatal', 'boolean').
      param('idle_timeout', 'Idle Timeout', 'pint32').
      param('inc_connections', 'Inc Connections', 'pint32').
      param('max_connections', 'Max Connections', 'pint32').
      param('min_connections', 'Min Connections', 'pint32').
      param('multiple_connections', 'Multiple Connections', 'bit').
      param('reconnect', 'Reconnect', 'boolean').
      param('validate_timeout', 'Validate Timeout', 'pint32')

    let(:params) { res.params }

    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_file(filename).with_content(res.content) }
    it do
      is_expected.to contain_file(filename).
        that_notifies('Service[bareos-dir]').
        that_notifies('Exec[bareos director init catalog]')
    end
  end

  context 'with ensure absent' do
    let(:params) { { 'ensure' => 'absent' } }

    it { is_expected.to contain_file(filename).with_ensure('absent') }
  end
end
