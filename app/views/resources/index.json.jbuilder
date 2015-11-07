json.array!(@resources) do |resource|
  json.extract! resource, :id
  json.extract! resource, :designation
  json.extract! resource, :path
end
