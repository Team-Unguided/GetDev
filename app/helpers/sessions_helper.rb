module SessionsHelper
  # Logs in the given user.
  def log_in(user)
    # uses rails session function.
    # it creates a temprorary cookie that is encrypted
    session[:user_id] = user.id # save the logged-in users's UID (NOT USERNAME!)
  end
  
  # Logs out the current user.
  def log_out
    session.delete(:user_id)  # delete the saved UID in temporary session cookie 
    @current_user = nil       # forget about @current_user's log-in status
  end
  
  # Returns the current logged-in user (if any).
  def current_user
    # save current_user to @current_user
    # so subsequent calls to current_user() does not hit the database again
    # i.e. this function searches the database iff @current_user is nil
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  
  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    # current_user will be nil when the user is not logged in
    !current_user.nil?
  end
end
