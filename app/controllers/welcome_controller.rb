class WelcomeController < ApplicationController

	def index
		if params[:value] == "2"
			@users = User.find(2)
		elsif params[:value] == "3"
			@users = User.find(3)
		elsif params[:value] == "4"
			@users = User.find(4)
		else
			@users = User.last
		end
		@hash = Gmaps4rails.build_markers(@users) do |user, marker|
		 	marker.lat user.latitude
  			marker.lng user.longitude
  			marker.infowindow user.title
		end
		if params[:value] == "2"
			@picture = ActionController::Base.helpers.asset_path("2.png")
		elsif params[:value] == "3"
			@picture = ActionController::Base.helpers.asset_path("3.png")
		elsif params[:value] == "4"
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