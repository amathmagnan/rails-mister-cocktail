class Ingredient < ApplicationRecord
  has_many :doses
  validates :name, presence: true
  validates :name, uniqueness: true
  has_many_attached :photos

  has_one_attached :banner
  has_many_attached :pictures

end
