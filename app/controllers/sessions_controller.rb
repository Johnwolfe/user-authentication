class SessionsController < ApplicationController

	def new
	end

	def create
		@user =  User.authenticate(params[:email], params[:password])
		if @user
		#  log them in
		session[:user_id] = @user.id

		redirect_to '/'
		else
			#add flash not logged in
			redirect_to log_in_path
		#send them back to the log in form and ask them to try again
		end
	end

	def destroy
		session[:user_id] = nil
		# flash let user know they've been logged out
		redirect_to '/users/index'
	end


end
