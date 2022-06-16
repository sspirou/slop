class MealsController < ApplicationController
    before_action :set_recipe
    before_action :set_user
    before_action :authenticate_user
    before_action :is_same_user

    def add_recipe
        Meal.create({recipe_id: @recipe.id, user_id: @user.id})
        redirect_to user_url(@user)
    end

    def drop_recipe
        m = Meal.all.find_by(recipe_id: @recipe.id, user_id: @user.id)
        if m
            m.destroy
        end
        redirect_to user_url(@user)
    end

    private

    def set_recipe
        @recipe = Recipe.all.find_by(id: params[:recipe_id])
    end

    def set_user
        @user = User.all.find_by(id: params[:user_id])
    end

    def is_same_user
        if current_user.id != params[:user_id].to_i
            redirect_to '/recipes'
        end
    end
end