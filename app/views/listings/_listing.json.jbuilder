json.extract! listing, :id, :name, :description, :price, :category_id, :condition, :created_at, :updated_at
json.url listing_url(listing, format: :json)
