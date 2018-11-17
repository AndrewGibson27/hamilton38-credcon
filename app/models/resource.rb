class Resource < ApplicationRecord
  enum subtype: [:domain, :url]

  validates_presence_of :path, :subtype
end
