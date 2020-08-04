class Song < ApplicationRecord
  validates :title, presence: true
  validates :released, 
end
