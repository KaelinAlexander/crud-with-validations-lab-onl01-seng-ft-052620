class Song < ApplicationRecord
  validates :title, presence: true, uniqueness: {scope: :release_year}
  validates :released, inclusion: {in: %w(true false)}
  validates :release_year, presence: true, if: :released?, numericality: {less_than_or_equal_to: :current_year}
  validates :artist, presence: true

  def released?
    released == true
  end

  def current_year
    Date.today.year
  end

end
