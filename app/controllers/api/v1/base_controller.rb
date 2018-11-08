class Api::V1::BaseController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :require_login!, except: [:index, :show]
  # helper_method :current_user

  def require_login!
    return true if authenticate_token
    render json: { errors: [ { detail: "Access denied, Token Key or Value incorrect!" } ] }, status: 401
  end

  private

  def authenticate_token
    # To test if Token is present
    # p request.headers['Authorization'], request.headers['HTTP_AUTHORIZATION']

    authenticate_with_http_token do |token, options|
      User.find_by(authentication_token: token)
      # Rails.logger.info "#{token}" -- Test for Tokens Presence
    end
  end
end
