class UsersController < ApplicationController
  def logged_in_index
   @user = User.find(params[:id])
   @reviews = @user.reviews
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def login
  end

  def logout
  end

end
