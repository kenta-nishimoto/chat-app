Rails.application.routes.draw do
  devise_for :users
  # 下記はルートパス
  root "rooms#index"

  # 下記の記述はユーザーの名前やパスワードを編集するために設定されている
  resources :users, only: [:edit, :update]

  # 下記のルーティングはチャットルームの新規作成のために記述
  resources :rooms, only: [:new, :create]

  # 下記の記述でメッセージが送信されDBに保存されるルーティングが作られた。
  # destroyのルーティングで「チャットを終了する」を押すとDBからチャットが削除されるルーティングの作成が可能に
  resources :rooms, only: [:new, :create, :destroy] do
    resources :messages, only: [:index, :create]
  end
  # ネスト関係にすることでルームの中にメッセージが存在する親子関係となり
  # メッセージに結びつくroomのidも受け取れるようになる
end