class SubscriptionType < ActiveRecord::Base

  validates :subscription_type,
            presence: true

  validates :subscription_type, uniqueness: true

  has_many :trips

end
