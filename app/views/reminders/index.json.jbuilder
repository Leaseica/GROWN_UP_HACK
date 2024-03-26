json.array!(@reminders) do |reminder|
  json.extract! reminder, :id, :title, :start_time
  json.url reminder_url(reminder, format: :json)
end
