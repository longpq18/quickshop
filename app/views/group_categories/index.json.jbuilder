json.array!(@group_categories) do |group_category|
  json.extract! group_category, :id, :name, :status
  json.url group_category_url(group_category, format: :json)
end
