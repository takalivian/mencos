class UsersController < ApplicationController
  def show
    @user=User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit( :image, :name, :email, :age, :hair_quality, :hair_length, :skin_quality, :remark)
  end

end
