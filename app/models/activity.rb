class Activity < ApplicationRecord
  belongs_to :list
  has_many :notes, dependent: :destroy
end
