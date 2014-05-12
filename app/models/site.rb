class Site
  include Mongoid::Document

  field :name
  field :token

  validates :name, :token, uniqueness: true
end
