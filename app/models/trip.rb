class Trip < ActiveRecord::Base

  validates :duration,
            :start_date,
            :start_station_id,
            :end_date,
            :end_station_id,
            :bike_id,
            :subscription_type_id,
            :user_zip_code,
            presence: true

  belongs_to :start_station, class_name: 'Station', :foreign_key => :start_station_id
  belongs_to :end_station, class_name: 'Station', :foreign_key => :end_station_id
  belongs_to :subscription_type
  belongs_to :weather_condition, :foreign_key => :start_date

end
