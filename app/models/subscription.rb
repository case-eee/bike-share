class Subscription < ActiveRecord::Base

 def self.write(subscription_details)
 require 'pry'; binding.pry
    self.find_or_create_by(subscription_details)
 end

end