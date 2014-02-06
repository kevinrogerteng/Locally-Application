class UsersController < ApplicationController
	include UsersHelper

	def index
	end

	def show
		@user = User.find(params[:id])
		if check_user
			render :show
		else 
			render :friend
		end
	 
	end

	def new
		@user = User.new()
	end

	def create
		@user=User.new(user_params)
		if @user.save
			flash[:success] = "Welcome to the Locally! #{@user.name}"
			sign_in @user
			redirect_to trips_path
		else
			render'new'
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update_attributes(params[:user])
		render :show
	end

	private

	def user_params
	 	params.require(:user).permit(:name, :screen_name, :email_address, :password, :password_confirmation, :hometown)
	end


end
