require_relative '../spec_helper'

describe 'SubscriptionType' do

  describe 'validates' do
    it 'presence of subscription_type' do
      invalid_subscription_type = SubscriptionType.create(subscription_type: "")
      expect(invalid_subscription_type).to be_invalid
    end

    it 'uniqueness of subscription_type' do
      SubscriptionType.create(subscription_type: "Subscriber")
      invalid_subscription_type = SubscriptionType.create(subscription_type: "Subscriber")
      expect(invalid_subscription_type).to be_invalid
    end
  end

end
