class TripsController < ApplicationController

	def index
		@current_user = current_user
		@trips = current_user.trips
	end

	def new
		@trip = Trip.new
	end

	def create
		new_trip = Trip.create(trip_params)
		user = current_user.trips
		user << new_trip
		binding.pry
		redirect_to trip_path(new_trip.id)
	end

	def edit
		id = params[:id]
		@trip = Trip.find(id)
	end

	def update
		id = params[:id]
		trip = Trip.find(id)
		trip.update(trip_params)
		redirect_to trip_path(trip.id)

	end

	def show 
		id = params[:id]
		@trip = Trip.find(id)
	end

	def destroy
		id = params[:id]
		Trip.find(id).destroy
		redirect_to trips_path

	end

	private

	def trip_params
		params.require(:trip).permit(:name, :description, :destination)
	end
end
