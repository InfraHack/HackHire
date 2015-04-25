DATA = {}

Dir[Rails.root.join('data', 'questions', '*.json')].each do |question|
  json = JSON.parse File.read(question)
  DATA[json['id']] = json
end
