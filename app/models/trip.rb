class Trip < ActiveRecord::Base
  belongs_to :trip_start, :class_name => 'Station', :foreign_key => 'start_station_id'
  belongs_to :trip_end, :class_name => 'Station', :foreign_key => 'end_station_id'

  attr_reader   :current_page,
                :trips_order

  def self.page_forward
    @trips_order = self.order(:start_date)
    @current_page ||= 0
    @current_page += 1
    count = current_page * 30
    trips_order[(count-30)...count]
  end

  def self.page_backward
    @current_page -= 1
    count = current_page * 30
    trips_order(:start_date)[(count-30)...count]
  end



end
