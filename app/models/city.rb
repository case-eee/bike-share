class City < ActiveRecord::Base
  has_many :stations
  validates :name, presence: true

  def self.write(city_details)
    self.find_or_create_by(city_details)
  end

end
