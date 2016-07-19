class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def authenticate_admin_user!
  authenticate_user!

    unless current_user.role?
      flash[:alert] = "This area is restricted to administrators only."
      redirect_to root_path
    end
  end

  def after_sign_in_path_for(resource)
      events_path
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