class ApplicationController < ActionController::API
  before_action :authenticate_request
  attr_reader :current_user, :db_user

  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    @db_user = User.find(@current_user[:id])
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end
end
