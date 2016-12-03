require "bundler"
Bundler.require

require "sinatra/activerecord/rake"
require 'CSV'
require './app/models/station'

desc "Import CSV to table"
task :import do
  create_stations
end

def create_stations
  CSV.foreach('db/csv/station.csv', :headers=> true) do |row|
    Station.create({name: row[1], dock_count: row[4], installation_date: row[6], city_id: row[5].to_i})
  end
  puts "Stations Table populated"
end
