class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, only: %w(index)

  def index
    render json: {
      data: {
        message: "Welcome #{current_user.first_name}",
        user: current_user
      }
    }, status: 200
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end
end
