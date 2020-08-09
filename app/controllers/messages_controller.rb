class MessagesController < ApplicationController
  
  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
    # ↪︎(params[:room_id])と記述することでparamsに含まれているroom_idを代入する。
    @messages = @room.messages.includes(:user)
    # ↪︎チャットルームに紐付いている全てのメッセージ（@room.messages）を@messagesと定義します。
    # この場合、メッセージに紐付くユーザー情報の取得に、
    # メッセージの数と同じ回数のアクセスが必要になるので、N+1問題が発生するためincludesを設定している
  end

  # 下記で_main_chat.html.erbのフォームから送られたパラメータを保存している
  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save
      redirect_to room_messages_path(@room)
    else
      render :index
    end
  end

  private
# 下記は_main_chat.html.erbのフォームから送られたパラメータを受け取るところ
  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end
  
end

