class Brevi < ApplicationRecord
  validates :slug, presence: true, uniqueness: true
  validates :original_url, presence: true, uniqueness: true
  before_create :generate_slug

  def generate_slug
    chars = ['0'..'9', 'A'..'Z', 'a'..'z'].map{|range| range.to_a}.flatten
    self.slug = 6.times.map{chars.sample}.join
    # Checks the DB to make sure the generated short_url above doesn't exist in the DB.
    self.slug = 6.times.map{chars.sample}.join until Brevi.find_by_slug(self.slug).nil?
  end
end
