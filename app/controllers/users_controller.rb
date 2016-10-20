class UsersController < ApplicationController
  def logged_in_index
  end

  def new
    auth_hash=session[:auth_hash]
    if User.find_by(uid: auth_hash["uid"], provider: 'github')
      flash[:notice]="You are already registered with github"
      return redirect_to root_path
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
  end

  def destroy
  end

  def login
  end

  def logout
  end

end
