require 'spec_helper'

describe 'bareos::storage::autochanger' do
  let(:title) { 'name' }

  filename = '/etc/bareos/bareos-sd.d/autochanger/name.conf'

  context 'with default values for all parameters will fail' do
    it { is_expected.to compile.and_raise_error(%r{.*}) }
  end

  context 'with required values' do
    let(:params) do
      {
        'changer_command' => '/bin/command',
        'changer_device'  => '/dev/tape',
        'device'          => 'name'
      }
    end
    let(:pre_condition) do
      '
      bareos::storage::device { "name":
        archive_device => "/dev/tape",
        media_type     => "DLT7000"
      }
      '
    end

    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_class('bareos::storage') }
    it { is_expected.to contain_file(filename).with_content(%r{^Autochanger \{$}) }
    it { is_expected.to contain_file(filename).with_content(%r{Name = "name"$}) }
    it { is_expected.to contain_file(filename).with_tag(['bareos', 'bareos_storage']) }
  end

  context 'with all params set' do
    res = BareosResourceHelper.new('Autochanger')
    res.param('name', 'Name', 'name').
      param('description', 'Description', 'string').
      param('changer_command', 'Changer Command', 'strname').
      param('changer_device', 'Changer Device', 'strname').
      param('device', 'Device', 'resource_list')

    let(:params) { res.params }
    # required resources
    let(:pre_condition) do
      '
      bareos::storage::device { "name":
        archive_device => "/dev/tape",
        media_type     => "DLT7000"
      }
      '
    end

    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_file(filename).with_content(res.content) }
    it do
      is_expected.to contain_file(filename).
        that_notifies('Service[bareos-sd]').
        that_requires('Bareos::Storage::Device[name]')
    end
  end

  context 'with ensure absent' do
    let(:params) { { 'ensure' => 'absent' } }

    it { is_expected.to contain_file(filename).with_ensure('absent') }
  end
end
