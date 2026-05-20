# frozen_string_literal: true

require 'spec_helper'

describe 'bareos::storage' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      context 'with default values for all parameters' do
        it do
          is_expected.to compile.with_all_deps
          is_expected.to contain_class('bareos')
        end
      end

      context 'with an autochanger and a device configured,' do
        let(:params) do
          {
            autochangers: {
              test: {
                changer_command: 'foo',
                changer_device: '/dev/foo',
                device: 'dev01',
              },
            },
            devices: {
              dev01: {
                archive_device: '/mnt/test',
                media_type: 'file',
              },
            },
          }
        end

        it do
          is_expected.to compile.with_all_deps
          is_expected.to contain_bareos__storage__autochanger('test')
            .with_changer_command('foo')
            .with_changer_device('/dev/foo')
            .with_device('dev01')
          is_expected.to contain_bareos__storage__device('dev01')
            .with_archive_device('/mnt/test')
            .with_media_type('file')
        end
      end

      context 'with a director configured,' do
        let(:params) do
          {
            directors: {
              test: {
                password: 'foobar',
              },
            },
          }
        end

        it do
          is_expected.to compile.with_all_deps
          is_expected.to contain_bareos__storage__director('test')
            .with_password('foobar')
        end
      end

      context 'with messages configured,' do
        let(:params) do
          {
            messages: {
              test: {
                description: 'test',
              },
            },
          }
        end

        it do
          is_expected.to compile.with_all_deps
          is_expected.to contain_bareos__storage__messages('test')
            .with_description('test')
        end
      end

      context 'with ndmps configured,' do
        let(:params) do
          {
            ndmps: {
              test: {
                username: 'test',
                password: 'foobar',
              },
            },
          }
        end

        it do
          is_expected.to compile.with_all_deps
          is_expected.to contain_bareos__storage__ndmp('test')
            .with_username('test')
            .with_password('foobar')
        end
      end
    end
  end
end
