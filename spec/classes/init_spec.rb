require 'spec_helper'
require 'shared_examples'

tests = {
  'with defaults parameters' => {},
  'with other repository release' => {
    'repository_release' => '21',
  },
  'with not managing client' => {
    'enable_client' => false,
  },
}


describe 'bareos', type: :class do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      defaults = get_defaults(facts)

      tests.each do |test, values|
        context test do
          params = defaults.merge(values)

          let(:params) do
            params
          end

          it {
            is_expected.to compile.with_all_deps
            is_expected.to contain_class('bareos::params')
          }

          include_examples 'repository', params, facts
          include_examples 'config', params, facts
          include_examples 'client', params, facts
          include_examples 'console', params, facts
          include_examples 'monitor', params, facts
        end
      end
    end
  end
end
