module TripsHelper

	def check_trip_owner
		trip = current_user.trips.where(:id => params[:id]).first
		if trip.nil?
			flash[:error] = "That's not your trip."
			redirect_to trips_path(params[:id])
		end
	end
end
