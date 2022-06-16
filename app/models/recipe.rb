class Recipe < ApplicationRecord
    has_many :meals, dependent: :destroy
    has_many :users, through: :meals
    validates :description, presence: true
    validates :name, presence: true, uniqueness: true
end
