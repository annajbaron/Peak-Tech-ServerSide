class Api::V1::Admin::UsersController < Api::ApplicationController
  before_action :authenticate_user!
  before_action :verify_admin!

  def index
    @users = User.order(created_at: :desc)
    render json: @users, each_serializer: UserSerializer
  end

  def toggle_admin
    @user = User.find(params[:id])
    @user.toggle!(:is_admin)
    render json: @user, serializer: UserSerializer
  end

end
