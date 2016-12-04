class Station < ActiveRecord::Base

  validates :name, :dock_count, :city_id, :installation_date, presence: true

  belongs_to :city

  has_many :trips

end