class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 #下記の記述でユーザー登録の際名前がないと登録できないようにした。
  validates :name, presence: true

  # 下記の記述で中間テーブルとアソシエーションが組まれている
  has_many :room_users
  has_many :rooms, through: :room_users

  # メッセージのアソシエーション
  # ↪︎ユーザーには多数のメッセージがあるためhas_manyを使用する
  has_many :messages
end

