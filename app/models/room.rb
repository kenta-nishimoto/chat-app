class Room < ApplicationRecord
  has_many :room_users
  has_many :users, through: :room_users, dependent: :destroy

  # メッセージのアソシエーション
  # 一つのroomには多数のメッセージがあるためhas_many
  has_many :messages, dependent: :destroy

  # 下記の記述でルーム名が空だと保存できないように設定した。
  validates :name, presence: true
end

# 下記は中間テーブルにアソシエーションを組んでいる
# has_many :room_users
# has_many :users, through: :room_users

# 上記の記述「dependent: :destroy」とは、
# 親要素が削除されたときに子要素も咲くジュしてくれるオプションのこと
# ↪︎今回はルームを消したらメッセージとroomに属しているユーザーも削除しないといけないため記述
# ※中間テーブルの情報が削除されるため、ユーザー情報が消えるわけではない