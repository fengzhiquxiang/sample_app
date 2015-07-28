json.array!(@replies) do |reply|
  json.extract! reply, :reply_to, :content
  json.url reply_url(reply, format: :json)
end