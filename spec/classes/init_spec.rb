# frozen_string_literal: true

require 'spec_helper'
describe 'bareos' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let :facts do
        facts
      end

      context 'with default values for all parameters' do
        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_class('bareos') }
      end

      context 'with repo_subscription: true, repo_username: "test", repo_password: "test"' do
        let(:params) do
          {
            repo_subscription: true,
            repo_username: 'test',
            repo_password: 'test'
          }
        end

        it { is_expected.to compile }

        it do
          expect(subject).to contain_class('bareos::repository').
            with_subscription(true).
            with_username('test').
            with_password('test')
        end
      end
    end
  end
end
