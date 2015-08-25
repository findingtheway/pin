json.array!(@dots) do |dot|
  json.extract! dot, :id, :description
  json.url dot_url(dot, format: :json)
end
