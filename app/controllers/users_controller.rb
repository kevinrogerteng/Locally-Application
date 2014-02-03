class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
	    @user=User.create(user_params)
	    if @user.save
	      flash[:success] = "Welcome to Locally!"
	      sign_in @user
	      redirect_to @user
	    else
	      render'new'
	    end
  	end

end
