class Property < ActiveRecord::Base
  has_many :images, as: :imageable, dependent: :destroy
  has_many :apartments
  accepts_nested_attributes_for :apartments, reject_if: :all_blank, allow_destroy: true
end
