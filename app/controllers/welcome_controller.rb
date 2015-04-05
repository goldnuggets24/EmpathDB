class WelcomeController < ApplicationController

	def index
		@users = User.all
		@hash = Gmaps4rails.build_markers(@users) do |user, marker|
		 	marker.lat user.latitude
  			marker.lng user.longitude
  			marker.infowindow user.title
		end
	end
end