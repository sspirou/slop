class User < ApplicationRecord
    paginates_per 10
    has_many :posts, dependent: :destroy
    has_many :meals, dependent: :destroy
    has_many :recipes, through: :meals
    has_many :exercises, dependent: :destroy
    has_many :workouts, through: :exercises
    validates :username, uniqueness: true, presence: true
    validates :bio, presence: true
    validates :city, presence: true
    validates :password_hash, presence: true
    validates :zipcode, presence: true

    include BCrypt

    def password
        @password ||= Password.new(password_hash)
    end

    def password=(new_password)
        @password = Password.create(new_password)
        self.password_hash = @password
    end
end
