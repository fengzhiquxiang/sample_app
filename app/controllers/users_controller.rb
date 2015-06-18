class UsersController < ApplicationController
  def new
  end

  def show
  	@uu = User.find(params[:id])
  end

  def index
  	@us = User.all
  end
  
end
