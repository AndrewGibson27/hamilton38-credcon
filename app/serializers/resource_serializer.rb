class ResourceSerializer
  include FastJsonapi::ObjectSerializer
  attributes :path
  attributes :mentions
  attributes :trending
end
