class WelcomeController < ApplicationController

	def index
		if params[:value] == "2"
			@users = User.where(:time_range => "week")
		elsif params[:value] == "3"
			@users = User.where(:time_range => "month")
		elsif params[:value] == "4"
			@users = User.where(:time_range => "year")
		else
			@users = User.where(:time_range => "day")
		end
		@hash = Gmaps4rails.build_markers(@users) do |user, marker|
		 	marker.lat user.latitude
  			marker.lng user.longitude
  			marker.infowindow user.title
  			marker.picture({
                  :url => "http://megaicons.net/static/img/icons_sizes/15/534/32/map-marker-ball-left-pink-icon.png",
                  :width   => 32,
                  :height  => 32
                 })
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