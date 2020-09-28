require 'spec_helper'
describe 'bareos::storage' do
  on_supported_os.each do |os, facts|
    context "on #{os} " do
      let :facts do
        facts
      end

      context 'with default values for all parameters' do
        it { is_expected.to compile }
        it { is_expected.to contain_class('bareos') }
      end

      context 'with autochangers => { test: { changer_command => "foo", changer_device => "/dev/foo", device => "dev01" }}, devices => { dev01: { archive_device => "/mnt/test", media_type => "file" }}}' do
        let(:params) do
          {
            autochangers: {
              test: {
                changer_command: 'foo',
                changer_device: '/dev/foo',
                device: 'dev01'
              }
            },
            devices: {
              dev01: {
                archive_device: '/mnt/test',
                media_type: 'file'
              }
            }
          }
        end

        it { is_expected.to compile }
        it do
          is_expected.to contain_bareos__storage__autochanger('test').
            with_changer_command('foo').
            with_changer_device('/dev/foo').
            with_device('dev01')
          is_expected.to contain_bareos__storage__device('dev01').
            with_archive_device('/mnt/test').
            with_media_type('file')
        end
      end

      context 'with directors => { test: { password => "foobar" }}}' do
        let(:params) do
          {
            directors: {
              test: {
                password: 'foobar'
              }
            }
          }
        end

        it { is_expected.to compile }
        it do
          is_expected.to contain_bareos__storage__director('test').
            with_password('foobar')
        end
      end

      context 'with messages => { test: { description => "test" }}}' do
        let(:params) do
          {
            messages: {
              test: {
                description: 'test'
              }
            }
          }
        end

        it { is_expected.to compile }
        it do
          is_expected.to contain_bareos__storage__messages('test').
            with_description('test')
        end
      end

      context 'with ndmps => { test: { username => "test", password => "foobar" }}}' do
        let(:params) do
          {
            ndmps: {
              test: {
                username: 'test',
                password: 'foobar'
              }
            }
          }
        end

        it { is_expected.to compile }
        it do
          is_expected.to contain_bareos__storage__ndmp('test').
            with_username('test').
            with_password('foobar')
        end
      end
    end
  end
end
