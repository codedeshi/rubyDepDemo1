class UsersController < ApplicationController

	def create
		user = User.create(user_params)
		if user.errors.full_messages.length !=0 
			flash[:errors] = user.errors.full_messages 
			redirect_to :back
		else 
			session[:user_id] = user.id
			redirect_to groups_path
		end
	end

	private

	def user_params
		params.require(:user).permit(:fname, :lname,:email, :password)
	end
end
