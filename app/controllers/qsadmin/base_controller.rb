class Qsadmin::BaseController < ApplicationController
	before_action :authorize

	layout 'layouts/admin/admin'

	def check_login
		if session[:user_id] 
			if (session[:user_name] == "hklong") then
				redirect_to qsadmin_dashboards_path
			else
				redirect_to root_path
			end
		else
			redirect_to '/sessions/new'
		end
		
	end

	private

		def not_authenticated
			redirect_to '/sessions/new', alert: "Please login first"
		end
end