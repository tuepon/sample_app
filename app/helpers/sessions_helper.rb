module SessionsHelper
  
  # Login with passed user
  def log_in(user)
    session[:user_id] = user.id
  end
  
  # return login user if exists
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end
  
  # return true/false if user logged in or not
  def logged_in?
    !current_user.nil?
  end
  
  # logout current user
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
