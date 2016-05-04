json.array!(@qsadmin_posts) do |qsadmin_post|
  json.extract! qsadmin_post, :id
  json.url qsadmin_post_url(qsadmin_post, format: :json)
end
