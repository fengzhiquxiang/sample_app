class UsersController < ApplicationController
  def new
  end

  def show
  	@uu = User.find_by_email("michael@example.com")
  end

  def index
  	@us = User.all
  end
end
