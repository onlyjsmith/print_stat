desc "Refresh printer stats"
task :refresh_all => :environment do
  Stat.refresh_all
end