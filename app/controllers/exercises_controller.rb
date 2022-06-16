class ExercisesController < ApplicationController
    before_action :set_workout
    before_action :set_user
    before_action :authenticate_user
    before_action :is_same_user

    def add_workout
        Exercise.create({workout_id: @workout.id, user_id: @user.id})
        redirect_to user_url(@user)
    end

    def drop_workout
        e = Exercise.all.find_by(workout_id: @workout.id, user_id: @user.id)
        if e
            e.destroy
        end
        redirect_to user_url(@user)
    end

    private

    def set_workout
        @workout = Workout.all.find_by(id: params[:workout_id])
    end

    def set_user
        @user = User.all.find_by(id: params[:user_id])
    end

    def is_same_user
        if current_user.id != params[:user_id].to_i
            redirect_to '/workouts'
        end
    end
end