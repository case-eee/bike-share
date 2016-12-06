class SubscriptionType < ActiveRecord::Base

  validates :subscription_type,
            presence: true

  has_many :trips

end
