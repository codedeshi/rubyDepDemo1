class GroupsController < ApplicationController

	def index
		@user = User.find(session[:user_id]) 
		@groups = Group.all
	end

	def create
		data = group_params
		data['user'] = User.find(session[:user_id])
		group = Group.create(data)
		if group.errors.full_messages.length !=0 
			flash[:errors] = group.errors.full_messages
			redirect_to :back
		else
			Mebership.create(user:User.find(session[:user_id]),group:group)
			redirect_to :back
		end
	end

	def show
		@group = Group.find(params[:id])
		@members = @group.meberships.pluck(:user_id)
	end

	def destroy
		Group.find(params[:id]).delete
		redirect_to :back
	end

	private

	def group_params
		params.require(:group).permit(:name, :description)
	end
end
