class Condition < ActiveRecord::Base
  self.primary_key = 'date'
  has_many :trips, :foreign_key => 'start_date'
end
