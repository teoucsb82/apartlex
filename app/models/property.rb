class Property < ActiveRecord::Base
  extend FriendlyId
  friendly_id :pretty_name, use: :slugged
  has_many :images, as: :imageable, dependent: :destroy
  has_many :apartments
  accepts_nested_attributes_for :apartments, reject_if: :all_blank, allow_destroy: true


  def pretty_name
    "#{street.split(" ").map(&:humanize).join(" ")}, #{city.split(" ").map(&:humanize).join(" ")} #{state.upcase} #{zip}"
  end

  def primary_photo
    return if images.blank?
    images.first.public_id
  end
end
