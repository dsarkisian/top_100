class Artist < ApplicationRecord
  has_many :songs, dependent: :destroy

  validates :name, length: { minimum: 2 }
  validates :name, length: { maximum: 20 }

  validates :name, uniqueness: true
end
