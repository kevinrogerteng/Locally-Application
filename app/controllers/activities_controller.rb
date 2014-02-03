class ActivitiesController < ApplicationController
	def new
		@activity = Activity.new
	end

	def create
	end

	def edit
	end

	def update
	end

	def show
	end

	def destroy
	end

	private

	def activity_params
		params.require(:activity).permit(:name, :address, :thumbnail_photo, :biz_url, :phone)

	end


end
