class RoomsController < ApplicationController
  
  # 下記はルートパスのビューを表示させる
  def index
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  # 下記の記述で「チャットを終了する」を押すとDBからチャットルームが削除される。
  # そのチャットルームかを指定するためRoom.find(params[:id])を記述。
  # チャット終了はビューが映り変わらないため、インスタンス変数を使わない
  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to root_path
  end

  private

  def room_params
    params.require(:room).permit(:name, user_ids:[])
    # new.html.erbから送られてくるデーターは以下のようになります。
    # {"room[user_ids][]" => "選択したユーザーのid"} %>
    # # 配列に対して保存を許可したい場合は、キーの名称と関連づけてバリューに「[]」と記述します。
  end
end
