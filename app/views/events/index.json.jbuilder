json.array!(@events) do |event|
  json.extract! event, :id, :meetup_id, :presentation_embeds, :links, :raw_data
  json.url event_url(event, format: :json)
end
