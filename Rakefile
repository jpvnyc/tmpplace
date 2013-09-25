require 'rake/testtask'
require 'standalone_migrations'
StandaloneMigrations::Tasks.load_tasks

task :default => [:test]

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/test*.rb']
  t.verbose = true
end
