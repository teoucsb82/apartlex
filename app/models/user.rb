class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :account
  has_many :properties, through: :account

  def create_account(params)
    return unless params[:user] && params[:user][:accounts] && params[:user][:accounts][:name]
    account = Account.create(name: params[:user][:accounts][:name], user_id: self.id)
  end
end
