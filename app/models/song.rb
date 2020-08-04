class Song < ApplicationRecord
  validates :title, presence: true, uniqueness: {scope: :release_year}
  validates :released, inclusion: {in: %w(true false)}
  validates :release_year, presence: true, if: :released?
  validates :artist, presence: true


  def released?
    released == true
  end

end
