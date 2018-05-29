class Brevi < ApplicationRecord
  validates :slug, presence: true, uniqueness: true
  validates :original_url, presence: true, uniqueness: true
end
