class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :authenticate_user, except: [:new, :create]
  before_action :check_user, except: [:new, :create, :index, :show]

  api_key = 'wuw6QSYjrA2UNG3iUV9m3AjhMVKvzVv5'

  # GET /users or /users.json
  def index
    @users = User.order(:username).page params[:page]
  end

  # GET /users/1 or /users/1.json
  def show
    location_array = Accuweather.city_search(name: @user.city)
    if location_array.length == 0
      @current_weather = 'Could not find weather for this city'
    else
      city = location_array.first
      @current_weather = Accuweather.get_conditions(location_id: city.id).current
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    @user.password = user_params[:password_hash]

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    @user.assign_attributes(user_params)
    @user.password = user_params[:password_hash]

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    reset_session

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :password_hash, :bio, :city, :zipcode)
    end
end
