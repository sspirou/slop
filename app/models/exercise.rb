class Exercise < ApplicationRecord
  belongs_to :user
  belongs_to :workout
  validates :user, uniqueness: { scope: :workout }
  validates :workout, uniqueness: { scope: :user }
end
