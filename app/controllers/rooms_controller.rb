class RoomsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @currentEntries = current_user.entries
    myRoomIds = []
  
    @currentEntries.each do |entry|
      myRoomIds << entry.room.id
    end
  
    @anotherEntries = Entry.where(room_id: myRoomIds).where('user_id != ?',current_user)
  end

  def create
    @room = Room.create
    @entry1 = Entry.create(:room_id => @room.id, :user_id => current_user.id)
    @entry2 = Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(:room_id => @room.id))
    redirect_to "/rooms/#{@room.id}"
  end

  def show
    @room = Room.find(params[:id])
    if Entry.where(:user_id => current_user.id, :room_id => @room.id).present?
      @messages = @room.messages
      @message = Message.new
      @entries = @room.entries
    else
      redirect_back(fallback_location: root_path)
    end

    @currentEntries = current_user.entries
    myRoomIds = []
    @currentEntries.each do |entry|
      myRoomIds << entry.room.id
    end
    @anotherEntries = Entry.where(room_id: myRoomIds).where('user_id != ?',current_user)

  end

end