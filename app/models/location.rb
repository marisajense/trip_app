class Location < ApplicationRecord
  validates_presence_of :name
  belongs_to :trip
  has_one :address
end
