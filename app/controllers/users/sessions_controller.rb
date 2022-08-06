# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    super
    # self.resource = warden.authenticate(auth_options)
    # if current_user.nil?
      
    #   render json: {"success": false, "error": "Invalid Email or Password"}, status: 401
    # else
    #   sign_in(resource_name, resource)
    #   render json: {"success": true, "data": current_user.as_json}, status: :ok
    # end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
