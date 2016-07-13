class UsersController < ApplicationController

	def index
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			# add flash later
			session[:user_id] = @user.id
		redirect_to '/users/index'
		else
			#add flash later
			redirect_to :back
		end
	end

	def show
	end

	private

	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation)
	end
end
