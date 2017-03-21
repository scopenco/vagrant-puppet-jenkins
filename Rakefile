#!/usr/bin/env rake

require 'kitchen/rake_tasks'

# Install puppet modules
desc 'Run librarian-puppet'
task :librarian do
  Dir.chdir 'puppet/environments/local'
  system 'librarian-puppet install'
end

# Integration tests. Kitchen.ci
desc 'Run Test Kitchen with Vagrant'
task :kitchen do
  Kitchen.logger = Kitchen.default_file_logger
  Kitchen::Config.new.instances.each(&:test)
end

# Default
task default: ['integration:vagrant']
