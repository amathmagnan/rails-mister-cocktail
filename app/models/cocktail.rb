class Cocktail < ApplicationRecord
  has_many :doses
  validates :name, presence: true
  validates :name, presence: true
end
