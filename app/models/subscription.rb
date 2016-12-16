class Subscription < ActiveRecord::Base
  has_many :trips do
    def percentage
      (count.to_f / Trip.count * 100).round(2)
    end
  end

  def self.write(subscription_details)
    self.find_or_create_by(subscription_details)
  end
end