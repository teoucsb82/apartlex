class Subscription < ActiveRecord::Base
  belongs_to :account
  has_many :subscription_payments

  validates_presence_of :account_id, message: "Please enter a company name"
  validates_inclusion_of :type_of, in: I18n.t("subscription").keys.map(&:to_s), message: "Please select a plan"
  before_create :validate_user

  def self.create_full_account(params)
    Subscription.transaction do
      subscription = Subscription.create(params[:accounts][:subscription])
    end
  end
end
