require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet-lint/tasks/puppet-lint'
require 'metadata-json-lint/rake_task'

if RUBY_VERSION >= '1.9'
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new
end

Rake::Task[:lint].clear
PuppetLint::RakeTask.new :lint do |config|
  # Pattern of files to check, defaults to `**/*.pp`
  config.pattern = '**/*.pp'

  # Pattern of files to ignore
  config.ignore_paths = ['spec/**/*.pp', 'vendor/**/*.pp', 'pkg/**/*.pp']

  # List of checks to disable
  config.disable_checks = ['80chars', '140chars']

  # Should puppet-lint prefix it's output with the file being checked,
  # defaults to true
  config.with_filename = false

  # Should the task fail if there were any warnings, defaults to false
  config.fail_on_warnings = true

  # Format string for puppet-lint's output (see the puppet-lint help output
  # for details
  config.log_format = '%{path}:%{line}/%{column}:%{KIND}: %{message}'

  # Print out the context for the problem, defaults to false
  config.with_context = true

  # Enable automatic fixing of problems, defaults to false
  config.fix = false

  # Show ignored problems in the output, defaults to false
  config.show_ignored = false

  # Compare module layout relative to the module root
  config.relative = true
end

desc 'Validate manifests, templates, and ruby files'
task :validate do
  Dir['manifests/**/*.pp'].each do |manifest|
    sh "puppet parser validate --noop #{manifest}"
    # check if none us ascii chars exists
    sh "tr -d \\\\000-\\\\177 < #{manifest} | wc -c | grep -q 0"
  end
  Dir['spec/**/*.rb', 'lib/**/*.rb'].each do |ruby_file|
    sh "ruby -c #{ruby_file}" unless ruby_file =~ %r{spec/fixtures}
  end
  Dir['templates/**/*.erb'].each do |template|
    sh "erb -P -x -T '-' #{template} | ruby -c"
  end
end

desc 'Run metadata_lint, lint, validate, and spec tests.'
task :test do
  [:metadata_lint, :lint, :validate, :spec].each do |test|
    Rake::Task[test].invoke
  end
end
