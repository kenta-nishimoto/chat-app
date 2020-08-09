class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # authenticate_user!：deviseに用意されているメソットでログインしていない場合は自動でサインイン画面へ遷移させる

  # 下記以降の記述でユーザの名前をDBに保存できるようにしている
  before_action :configure_permitted_parameters, if: :devise_controller?
  # ↪︎deviseのコントローラーから呼び出された場合は、configure_permitted_parametersメソッドが呼ばれます。

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # devise_parameter_sanitizerメソッドはdeviseでユーザー登録するときに使用できるメソッド
    # ↪︎特定のカラムのみ受け取りが可能。（今回はユーザーネームの受け取りを可能にしている）
  end
end
