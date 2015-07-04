class SessionsController < ApplicationController
	def signin
		
	end

	def create
		user = User.find_by_email(params[:session][:email].downcase)
	    if user && user.authenticate(params[:session][:password])
	      sign_in user
	      redirect_back_or user
	    else
	      flash.now[:error] = 'Invalid email/password combination'
	      # flash[:error] = 'Invalid email/password combination'
	      render 'signin'
	    end
	end

	def destroy
		sign_out
		flash.now[:notice] = 'welcome again!'
		render 'signin'
	end

end
