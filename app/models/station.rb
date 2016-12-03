class Station < ActiveRecord::Base

  validates :name, :dock_count, :city_id, :installation_date, presence: true

  def self.write(station_details)
    self.create(name: station_details[:name],
                lat: station_details[:lat],
                long: station_details[:long],
                dock_count: station_details[:dock_count],
                city_id: station_details[:city_id],
                installation_date: station_details[:installation_date]
                )
  end

end