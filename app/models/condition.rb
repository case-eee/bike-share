class Condition < ActiveRecord::Base
  self.primary_key = 'date'
  
  validates :date, :max_temperature_f, :mean_temperature_f, :min_temperature_f, :mean_humidity, :mean_visibility_miles, :max_wind_speed_mph, presence: true
  has_many :trips, :foreign_key => 'start_date'

  def self.make_temperature_range
    floor = minimum(:max_temperature_f)
    ceiling = maximum(:max_temperature_f)
    range = []

    until floor >= (ceiling - 10)  
      range << [floor, floor + 9]
      floor += 10
    end

    range << [floor, ceiling]

  end

  def self.chunk
    chunked = {}
    make_temperature_range.each do |range|
      chunked[range] = select(:max_temperature_f).group(:max_temperature_f).having("max_temperature_f >= #{range[0]} AND max_temperature_f <= #{range[1]}")
    end
    chunked
  end

  def self.results_hash 
    final = {}
    chunk.each do |k, v|
      final[k] = [v,"average_rides(v)", "high(v)", "low(v)"] 
    end
    final
  end

  def self.average_rides(v)
    arr = v.pluck(:max_temperature_f)
    all_trips = []
    arr.each do |x|
      unless x.nil?
        all_trips << Trip.where("max_temperature_f = #{x}").count
      end
    end
  end

  def self.high(v)
    "high"
  end

  def self.low(v)
    "low"
  end

end