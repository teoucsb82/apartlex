class Apartment < ActiveRecord::Base
  has_many :images, as: :imageable, dependent: :destroy
  belongs_to :property
end
