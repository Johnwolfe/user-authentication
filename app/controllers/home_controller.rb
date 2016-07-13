class HomeController < ApplicationController
	before_action :require_user
	def index
	end

	private

	def require_user
		if current_user
			true
		else
			redirect_to users_path
		end
	end
end
