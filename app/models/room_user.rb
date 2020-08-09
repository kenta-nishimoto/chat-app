# 中間テーブルの役割があるモデル
# このモデルを作った後に作るマイグレーションファイルに関連付けの記述を行う

class RoomUser < ApplicationRecord
  # アソシエションを組んでいる（ここは中間テーブルの役割があるため「belongs_to」の記述で行う）
  belongs_to :room
  belongs_to :user
end

# どのユーザーがどのチャットルームに参加しているかを管理するのが、
# 中間テーブルである「room_userテーブル」となります。