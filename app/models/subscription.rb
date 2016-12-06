class Subscription < ActiveRecord::Base
  has_many :trips

  def self.write(subscription_details)
    self.find_or_create_by(subscription_details)
  end
end