desc "Import CSV to table"
task :import do
  create_stations
end

def create_stations
  CSV.parse('db/csv/station.csv', :headers=> true) do |row|

    # How do we add stations with the city associations in mind?
end
  puts "Imported Stations to Table."
end

city = row[4]
City.find_by(name: "#{city}").stations.create()

# @raw_data = {}
#   file_path.map do |key, value|
#     raw_data[key] = CSV.read value, headers:true, header_converters: :symbol
#     end
# else
#   Iterate over that data and insert each into the table
#   def self.up
#     create_table :stations do |u|
#       u.name
#       u.created_at
#     end
