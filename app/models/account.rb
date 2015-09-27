class Account < ActiveRecord::Base
  RESERVED_SUBDOMAINS = %w(admin api assets blog calendar camo dashboard demo developer development developers dev docs files ftp git imap lab m mail manage mx pages pop pop3 secure sites smtp ssl stage staging status support www)
  belongs_to :user
  has_many :properties
  has_one :setting

  after_create :create_setting
  validates :name, presence: { message: "Please provide a company name." }
  validates :name, uniqueness: { case_sensitive: false, message: "Sorry, %{value} has already been taken." }
  validates :subdomain, uniqueness: true
  validates :subdomain, exclusion: { in: RESERVED_SUBDOMAINS, message: "Sorry, %{value} is reserved." }

  before_create :set_subdomain

  def set_subdomain
    self.subdomain = self.name.parameterize
  end
end
