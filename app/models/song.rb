class Song < ApplicationRecord
  validates :title, presence: true, uniqueness: {scope: :release_year}
  validates :released, inclusion: {in: %w(true false)}
  validates :release_year, 
  validates :artist, presence: true
