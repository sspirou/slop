class Post < ApplicationRecord
  belongs_to :recipe
  belongs_to :workout
  belongs_to :user
  validates :description, presence: true
  validates :user, presence: true
end
