class SitesController < ApplicationController

	def index
		@user = User.new()
		if signed_in?
			redirect_to trips_path
		end
	end
end
