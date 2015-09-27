class Account < ActiveRecord::Base
  belongs_to :user
  has_many :properties
  has_one :setting

  after_create :create_setting
  validates :name, presence: { message: "Please provide a company name" }
  validates :name, uniqueness: { case_sensitive: false, message: "Sorry, that name has been taken" }
end
