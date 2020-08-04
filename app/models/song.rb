class Song < ApplicationRecord
  validates :title, presence: true, uniqueness: {scope: :release_year}
  validates :release_year, presence: true, if: :released
  validate :check_dates
  validates :release_year, numericality: {less_than_or_equal_to: :current_year}
  validates :artist_name, presence: true

  private

  def current_year
    Time.now.year
  end

  def check_dates
    if self.release_year && self.release_year > Date.today.year
      self.errors.add(:release_year, "Can't be in the future")
    end
  end

end
