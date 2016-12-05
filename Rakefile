require "bundler"
Bundler.require

require "sinatra/activerecord/rake"

namespace :db do
  require_relative "db/seeds"
  desc "Import CSV to table"
  task :import_csv => :environment do
    import_station_csv
  end
end