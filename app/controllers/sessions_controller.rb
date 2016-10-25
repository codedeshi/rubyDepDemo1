class SessionsController < ApplicationController

		def create
		user = User.find_by(:email => user_params[:email])
		if user
			if  user.authenticate(user_params[:password])
				session[:user_id] = user.id 
				redirect_to groups_path
			else
				flash[:errors] = ["Invalid password"]
				redirect_to :back
			end
		else
			flash[:errors] = ["User not found"]
			redirect_to :back
		end 
	end 

	def destroy
		session.clear
		redirect_to root_path
	end

	private

	def user_params
		params.require(:user).permit(:email, :password)
	end
end
