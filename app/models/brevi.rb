class Brevi < ApplicationRecord
  validates :slug, presence: true, uniqueness: true
  validates :original_url, presence: true, uniqueness: true, format: {
    with: URI.regexp(%w(http https)), message: 'Bad url format'}
  before_validation :generate_slug

  def generate_slug
    chars = ['0'..'9', 'A'..'Z', 'a'..'z'].map{|range| range.to_a}.flatten
    attempts = 4
    self.slug = attempts.times.map{chars.sample}.join
    # Checks the DB to make sure the generated short_url above doesn't exist in the DB.
    until Brevi.find_by_slug(self.slug).nil? do
      attempts += 1
      self.slug = attempts.times.map{chars.sample}.join
    end
  end
end
