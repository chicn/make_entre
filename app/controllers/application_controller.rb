class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    case resource
    when user
      events_path
    when admin_user
      new_admin_user_session_path
    end
  end

  def after_sign_out_path_for(resource)
      events_path
  end

  include ApplicationHelper

  private
  # 以下の1行は消さないでください
 
 


  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end 
end