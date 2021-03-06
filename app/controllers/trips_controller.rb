class TripsController < ApplicationController
	include TripsHelper
	before_filter :signed_in_user, only: [:create, :new, :edit, :update]
	before_filter :check_trip_owner, only: [:destroy, :update, :edit]
	
	def index
		@trip = Trip.new
		if signed_in?
			@current_user = current_user
			@trips = current_user.trips
		else 
			redirect_to root_url
		end
	end

	def new
		@current_user = current_user
		@trip = Trip.new
	end

	def create
		new_trip = Trip.create(trip_params)
		user = current_user.trips
		user << new_trip
		redirect_to trip_path(new_trip.id)
	end

	def edit
		@current_user = current_user
		id = params[:id]
		@trip = Trip.find(id)
	end

	def update
		id = params[:id]
		trip = Trip.find(id)
		trip.update(trip_params)
		flash[:success] = "#{trip.name} has been updated!!"
		redirect_to trip_path(trip.id)
	end

	def show 
		@current_user = current_user
		id = params[:id]
		@trip = Trip.find(id)
		@activity = @trip.activities

		if params[:search] == nil
			restaurant = "restaurants"
			offset_number = 10
		else
			restaurant = params[:search].gsub(" ", "+")
			offset_number = 0
		end
		location = @trip.destination.delete(",").gsub(" ", "+")
		consumer_key = 'fRaHH5Mu6S5cERbTaBA9mw'
		consumer_secret = 'mrmPWhiK1WCg38bAaTFHUKbObjU'
		token = '_C6ontQXlmTwpclGbyBvjSspIv7kQc3J'
		token_secret = 'PdL3RC0CmFNUe64ADdm0WR02dko'

		api_host = 'api.yelp.com'

		consumer = OAuth::Consumer.new(consumer_key, consumer_secret, {:site => "http://#{api_host}"})
		access_token = OAuth::AccessToken.new(consumer, token, token_secret)
		path = "/v2/search?term=#{restaurant}&location=#{location}&limit=10&sort=0&offset=#{offset_number}"
		result = JSON.parse(access_token.get(path).body)["businesses"]
		if result.nil? || result == "" || result.empty?
			@result = ""
		else 
			@result = result
		end
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
