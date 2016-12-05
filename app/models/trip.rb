class Trip < ActiveRecord::Base
  validates :duration, :start_date, :start_station_name, :start_station_id,
            :end_date, :end_station_name, :end_station_id, :bike_id,
            :subscription_type, :zip_code, presence: true
            
end
