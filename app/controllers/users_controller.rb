class UsersController < ApplicationController
    before_action :set_current_user, only: [:logged_in_index, :new, :edit, :update, :destroy]


  def logged_in_index
  end

  def new
    if @user
      flash[:notice]="You are already registered with github"
      return redirect_to index_path
    end

    if auth_hash == nil 
      return redirect_to "/auth/github" 
    end
    @user=User.build_from_github(session[:auth_hash])
  end

  def create
    @user=User.new
    flash[:notice] = "unable to save user"
    @user.name = params[:user][:name]
    @user.email = params[:user][:email]
    @user.uid = params[:user][:uid]
    @user.provider = params[:user][:provider]
    
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "successfully logged in!"
    end
    return redirect_to root_path 
  end

  def edit
  end

  def update
    flash[:notice]= "details failed to save"
    @user.name = params[:user][:name]
    @user.email = params[:user][:email]
    flash[:notice]= "information updated" if @user.save 
  end

  def destroy
  end

  def login
  end

  def logout
  end
  private

  def set_current_user
    auth_hash=session[:auth_hash]
    @user=User.find_by(uid: auth_hash["uid"], provider: 'github')
  end
end
