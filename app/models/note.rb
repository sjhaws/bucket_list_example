class Note < ApplicationRecord
  belongs_to :activity
  validates_presence_of :body
end
