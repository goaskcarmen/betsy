class SessionsController < ApplicationController

  def create
    auth_hash = request.env['omniauth.auth']
    #flash is a built in thing that is saved in the session hash#

    flash[:notice] = "login failed!" #this is just setting the value of the flash notice, it will not show up unless we hit the redirect in the next line. i.e. flash notices only come up if things go wrong#
    return redirect to index_path unless auth_hash['uid']

    if @user.nil?
        session[:auth_hash]=auth_hash
        return redirect_to users_new_path
    end
    # Save the user ID in the session
    session[:user_id] = @user.id

    flash[:notice] = "successfully logged in!"

    redirect_to index_path

  end

  def destroy
    session[:user_id] = nil
    redirect_to index_path
  end

end
