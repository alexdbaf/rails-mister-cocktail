class Dose < ApplicationRecord
  belongs_to :ingredient
  belongs_to :cocktail, dependent: :destroy

  validates :cocktail_id, uniqueness: { scope: [:ingredient_id] }
end
