# これは中間テーブルのためのマイグレーションファイルである

class CreateRoomUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :room_users do |t|
      t.references :room, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end

# referencesとは外部キーを使用するために使う型
# 外部キーとは別のテーブルのカラムを参照すること
# ↪︎「foreign_key: true」という制約を設けることで、他テーブルの情報を参照できます。

