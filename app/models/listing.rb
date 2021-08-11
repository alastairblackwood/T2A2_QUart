class Listing < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :feature_listings, dependent: :destroy
  has_many :features, through: :feature_listings
  accepts_nested_attributes_for :feature_listings
  has_one_attached :picture
  before_save :remove_whitespace

private

  def remove_whitespace
    self.name = self.name.strip
    self.description = self.description.strip
  end

end
