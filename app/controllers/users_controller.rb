class UsersController < ApplicationController
	# before_action :require_login, except: [:new, :create]
	# before_action :require_correct_user, only: [:show, :edit, :update, :destroy]

	def create
		user = User.create(user_params)
		if user.errors.full_messages.length !=0 
			flash[:errors] = user.errors.full_messages 
			redirect_to new_user_path
		else 
			session[:user_id] = user.id
			redirect_to user_path(user.id)
		end
	end

	private

	def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
	end
end

