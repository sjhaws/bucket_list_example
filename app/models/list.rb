class List < ApplicationRecord
  has_one :destination, dependent: :destroy
  has_many :activities, dependent: :destroy
  validates_presence_of :name
end
