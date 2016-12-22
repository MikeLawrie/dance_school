class Admin::RoomsController < Admin::BaseController
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to admin_room_path(@room), notice: 'Группа создана.'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @room.update(room_params)
      redirect_to admin_room_path(@room), notice: 'Группа изменена.'
    else
      render :edit
    end
  end

  def destroy
    @room.destroy
    redirect_to admin_rooms_path, notice: 'Группа удалена.'
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:title)
  end
end
