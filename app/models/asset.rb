class Asset
  include Mongoid::Document

  field :title
  field :description

  field :file_uid
  image_accessor :file

  validates_presence_of :file, :title, :description
end

