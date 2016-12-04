class Trip < ActiveRecord::Base
  belongs_to :trip_start, :class_name => 'Station', :foreign_key => 'start_station_id'
  belongs_to :trip_end, :class_name => 'Station', :foreign_key => 'end_station_id'
end