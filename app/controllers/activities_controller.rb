class ActivitiesController < ApplicationController
	def new
		session[:return_to] ||= request.referer
		@activity = Activity.new
		@trip = params[:id]
	end

	def create
		session[:return_to] ||= request.referer
		new_activity = Activity.create(activity_params)
		trip = params[:id]
		add_trip = current_user.trips.find(trip)
		add_trip.activities << new_activity
		binding.pry
		redirect_to session.delete(:return_to)
	end

	def edit
		id = params[:activity_id]
		@activity = Activity.find(id)

	end

	def update
		id = params[:activity_id]
		trip = params[:id]
		activity = Activity.find(id)
		activity.update(activity_params)
		redirect_to trip_path(trip)
	end

	def show
		id = params[:activity_id]
		@trip = params[:id]
		@activity = Activity.find(id)
	end

	def destroy
		id = params[:activity_id]
		trip = params[:id]
		Activity.find(id).destroy
		redirect_to trip_path(trip)
	end

	private

	def activity_params
		params.require(:activity).permit(:name, :address, :thumbnail_photo, :biz_url, :phone, :yid, :rating)
	end
end
