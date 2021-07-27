class Listing < ApplicationRecord
  belongs_to :category
  # enum condition: { seedling: 0, healthy: 1, old_plant: 2, unsure: 3 }
end
