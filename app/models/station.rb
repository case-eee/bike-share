class Station < ActiveRecord::Base

  validates :name,
            :dock_count,
            :city_id,
            :installation_date,
            :lat,
            :long,
            presence: true

  belongs_to :city
  has_many :departure_trips, class_name: 'Trip', :foreign_key => :start_station_id
  has_many :arrival_trips, class_name: 'Trip', :foreign_key => :end_station_id


end
