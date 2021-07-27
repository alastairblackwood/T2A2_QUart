class Listing < ApplicationRecord
  belongs_to :category
  belongs_to :user
  # enum condition: { seedling: 0, healthy: 1, old_plant: 2, unsure: 3 }
  belongs_to :feature
  has_many :listing_features
  has_many :features, through: :listing_features
  # accepts_nested_attributes_for :feature_listings
end
