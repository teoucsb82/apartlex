class Subscription < ActiveRecord::Base
  belongs_to :account
  has_many :subscription_payments
end
