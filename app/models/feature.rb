class Feature < ApplicationRecord
    # belongs_to :listing
    has_many :feature_listings
    has_many :listings, through: :feature_listings
end
