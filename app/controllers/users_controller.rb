class UsersController < ApplicationController
  def show
    @user=User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit( :image, :name, :email, :age, :hair_quality, :hair_length, :skin_quality, :remark)
  end

end
