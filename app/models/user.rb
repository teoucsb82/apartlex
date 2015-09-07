class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :account

  def create_account(params)
    return unless params[:user] && params[:user][:accounts] && params[:user][:accounts][:company_name]
    Account.transaction do
      account = Account.create(company_name: params[:user][:accounts][:company_name])
      self.account_id = account.id
    end
  end
end
