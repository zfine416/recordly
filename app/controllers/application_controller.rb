class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery

  protected

  def after_sign_in_path_for(resource)
    user_albums_path
	end

	# def after_sign_up_path_for(resource)
	# 	user_user_album(current_user.id)
	# end
end
