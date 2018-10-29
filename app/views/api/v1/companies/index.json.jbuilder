json.array! @companies do |company|
  json.extract! company, :id, :name, :address
end
