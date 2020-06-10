class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :set_user, only: [:show, :edit, :update]
  def show
    unless @user.age.blank?
      @user_age = Agehash.find(@user.age)
    end
    @users = @user.followings
    @users2 = @user.followers
    @posts = @user.posts.includes(:user)

    @currentUserEntry=Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @user.id)
    if @user.id == current_user.id
    else
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
 
  end

  def edit
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
    params.require(:user).permit( :image, :name, :email, :age, :hair_quality, :hair_length, :skin_quality, :beard, :remark)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
