class WelcomeController < ApplicationController

	def index
		if params[:value] == "4"
			@users = User.first
		else
			@users = User.last
		end
		@hash = Gmaps4rails.build_markers(@users) do |user, marker|
		 	marker.lat user.latitude
  			marker.lng user.longitude
  			marker.infowindow user.title
		end
		if params[:value] == "4"
			@picture = ActionController::Base.helpers.asset_path("4.png")
		else
			@picture = ActionController::Base.helpers.asset_path("1.png")
		end
	
	respond_to do |format|
	    format.html
	    format.json
	  end
	end
end