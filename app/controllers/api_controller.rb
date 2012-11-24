class ApiController < ApplicationController
  respond_to :json

  include Api::SessionsHelper
  
  def check_user_auth
      render json: {success:false, message:"Could not authenticate"}, status: 401 if !current_user
  end
  
  def not_authorized(message = 'Could not authenticate')
    render json: {message:message}, status: 401
  end
  
  def not_found(message = 'Resource not found')
    render json: {message:message}, status: 404
  end
  
end
