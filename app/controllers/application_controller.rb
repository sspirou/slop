class ApplicationController < ActionController::Base
    helper_method :logged_in?, :current_user

    # Accuweather.api_key = 'wuw6QSYjrA2UNG3iUV9m3AjhMVKvzVv5'

    def logged_in?
        session[:user_id]
    end

    def current_user
        User.all.find_by(id: session[:user_id])
    end

    def authenticate_user
        if not session[:user_id]
            redirect_to '/login'
        end
    end

    def check_user
        if params[:id].to_i != current_user.id
            redirect_to '/users'
        end
    end
end
