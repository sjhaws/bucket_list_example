class Destination < ApplicationRecord
  belongs_to :list
  validates_presence_of :country
end
