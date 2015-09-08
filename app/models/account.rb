class Account < ActiveRecord::Base
  belongs_to :user
  has_many :properties
  has_one :setting

  after_create :create_setting
end
