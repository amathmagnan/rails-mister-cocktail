class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient, dependent: :destroy
  validates :description, presence: true
  validates_uniqueness_of :cocktail_id, scope: :ingredient_id
  has_many_attached :photos

  has_one_attached :banner
  has_many_attached :pictures

end
