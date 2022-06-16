class Meal < ApplicationRecord
  belongs_to :recipe
  belongs_to :user
  validates :user, uniqueness: { scope: :recipe }
  validates :recipe, uniqueness: { scope: :user }
end
