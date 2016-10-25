class MebershipsController < ApplicationController

	def create
		Mebership.create(user:User.find(session[:user_id]),group:Group.find(params[:id]))
		redirect_to :back
	end

	def destroy
		Mebership.where(user:session[:user_id],group:params[:id]).destroy_all
		redirect_to :back
	end
end
