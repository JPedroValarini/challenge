class Album < ApplicationRecord
  validates :name, presence: true
  validates :year, presence: true
  validates :artist, presence: true
end
