class UsersController < ApplicationController
  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
    # 上記のif文で編集に成功した場合はトップ画面へ遷移され、
    # 編集ができなかった場合編集画面のままに表示されるように設定した。
  end

  private

  def user_params
    # 下記の記述で名前とメールアドレスの変更を可能にしている。
    params.require(:user).permit(:name, :email)
  end
end
