class Workout < ApplicationRecord
    has_many :exercises, dependent: :destroy
    has_many :users, through: :exercises
    validates :description, presence: true
    validates :name, presence: true, uniqueness: true
end
