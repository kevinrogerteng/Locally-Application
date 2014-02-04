class TripsController < ApplicationController
	include YelpsHelper

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
		@activity = @trip.activities
		restaurant = params[:search]
		location = @trip.destination.delete(",").gsub(" ", "+")
		consumer_key = 'fRaHH5Mu6S5cERbTaBA9mw'
		consumer_secret = 'mrmPWhiK1WCg38bAaTFHUKbObjU'
		token = '1awdjTbqqntT553TWHTVI-QXBuur7mVw'
		token_secret = 'pWBLuU0QBMUJs7mPljvEnQcoivw'

		api_host = 'api.yelp.com'

		consumer = OAuth::Consumer.new(consumer_key, consumer_secret, {:site => "http://#{api_host}"})
		access_token = OAuth::AccessToken.new(consumer, token, token_secret)
		path = "/v2/search?term=restaurants&location=#{location}&limit=10&sort=0"
		@result = JSON.parse(access_token.get(path).body)["businesses"]
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
