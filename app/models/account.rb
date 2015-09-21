class Account < ActiveRecord::Base
  belongs_to :user
  has_many :properties
  has_one :setting

  after_create :create_setting
  validates_presence_of :name
  validates :name, uniqueness: true
end
