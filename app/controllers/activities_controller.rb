class ActivitiesController < ApplicationController
	def new
		@activity = Activity.new
		@trip = params[:id]
	end

	def create
		new_activity = Activity.create(activity_params)
		trip = params[:id]
		add_trip = current_user.trips.find(trip)
		add_trip.activities << new_activity
		redirect_to "/trips/#{trip}/activities/#{new_activity.id}"
	end

	def edit
	end

	def update

	end

	def show
		id = params[:activity_id]
		@activity = Activity.find(id)
	end

	def destroy
	end

	private

	def activity_params
		params.require(:activity).permit(:name, :address, :thumbnail_photo, :biz_url, :phone)
	end
end
