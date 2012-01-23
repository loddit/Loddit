desc "Run Watchr"
task :watchr do
  sh %{bundle exec spork cucumber &}
  sh %{bundle exec spork rspec &}
  sh %{bundle exec watchr .watchr}
end
