class UsersController < ApplicationController

  before_action :set_user
  respond_to :html, :json



  def show

  end

  def edit
  end

  def update
    # @user.avatar = params[:file]
    if @user.update(user_params)
      if params[:user][:avatar].present?
        render :crop
      else
        redirect_to @user
      end
    else
      render :new
    end
    # respond_with @user
  end

private

  def user_params
      params.require(:user).permit(:avatar, :crop_x, :crop_y, :crop_w, :crop_h)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
