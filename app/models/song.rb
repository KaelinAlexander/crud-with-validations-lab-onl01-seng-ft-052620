class Song < ApplicationRecord
  validates :title, presence: true, uniqueness: {scope: :release_year}
  validates :released, inclusion: {in: %w(true false)}
  validates :release_year, presence: true, if: :released?
  validates :release_year numericality: {less_than_or_equal_to: :current_year}
  validates :artist_name, presence: true

  def released?
    released == true
  end

  def current_year
    Time.now.year
  end

end
