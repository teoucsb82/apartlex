class User < ActiveRecord::Base
  attr_accessor :account_attributes

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :account
  accepts_nested_attributes_for :account, allow_destroy: true
  validates_associated :account
  has_many :properties, through: :account

  after_create :save_account

  def save_account
    account = create_account(account_attributes)
    unless account.valid?
      account.errors.each { |error_type, message| self.errors.add(error_type.to_sym, message) }
    end
    account.save!
  end
end
