class ApplicationController < ActionController::API
    before_action :authenticate_request,except: [:new, :create]

  attr_reader :current_user

  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'un Authorized' }, status: 401 unless @current_user
  end
end
