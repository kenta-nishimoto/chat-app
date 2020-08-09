class Message < ApplicationRecord

  # 下記はroomとuserに対するアソシエーション。
  # メッセージは一つのroomと一人のuserのためbelongs_toを使用
  belongs_to :room
  belongs_to :user

  # 下記の「has_one_attached」とは、各レコードと画像ファイルを1対1の関係で紐づけることができます。
  # つまり、記述したモデルの各レコードは1つの画像ファイルを添付できます。
  # Messagesテーブルの各レコードと画像ファイルを管理するimageカラムの紐付けに成功しました。
  # この時、Messagesテーブルにカラムを追加する必要はありません。
  has_one_attached :image

  # 下記の記述で空のメッセージは保存されないようになっている
  validates :content, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end
  # ※unless以降の記述のおかげで画像のみの送信も可能になった
end
