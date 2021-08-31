json.extract! suggestion, :id, :item_id, :title, :content, :image, :city_id, :created_at, :updated_at
json.url suggestion_url(suggestion, format: :json)
