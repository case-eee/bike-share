require "bundler"
Bundler.require

require "sinatra/activerecord/rake"

namespace :db do
  require_relative "db/seeds"

  desc "Import station.CSV into table"
  task :import_station_csv => :environment do
    import_station_csv
  end
  desc "Import trip.CSV into table"
  task :import_trip_csv => :environment do
    import_trip_csv
  end
  desc "Import condition.CSV into table"
  task :import_conditions_csv => :environment do
    import_conditions_csv
  end
end