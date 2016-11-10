class Trip < ApplicationRecord
  validates_presence_of :title
  has_many :locations, dependent: :destroy
end
