class SessionsController < ApplicationController

  def create   #login
    user = User.find_by_credentials(params[:email], params[:password])
    
    if !user.nil?
      user.generate_session_token!
      redirect_to user_url(user.id)
    else
      render json: 'User do not exsist', status: 422
    end
  end




  def destroy
    user = current_user
    user.reset_session_token! 
    redirect_to users_url
  end

end
