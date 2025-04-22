class Address
  include ActiveModel::Model

  attr_accessor :zip

  validates :zip, presence: true
end
