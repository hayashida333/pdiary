# frozen_string_literal: true

module Admin
  class UsersController < ApplicationController
    def index
      @users = User.all
    end

    def show
      @user = User.find(params[:id])
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to admin_users_path
      else
        render :new
      end
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      # id が params[:id] と一致する User を検索
      @user = User.find(params[:id])

      # --- 以降、User が取得できている前提のコード. なぜなら取得できていないとエラーになるから ---

      # NOTE: パスワード以外だけを変更したい場合に、パスワードを入力する必要がないようにしている
      if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
        params[:user].extract!(:password, :password_confirmation)
      end

      # update メソッドを実行
      # update メソッドは引数のパラメータ(formから送られてきた値)で user を更新しようとする
      # update メソッドは更新に成功すると true を返す。失敗すると false を返す
      if @user.update(user_params)
        # 更新に成功した場合こっち
        # 更新に成功したら、ユーザ一覧画面にリダイレクトさせる
        redirect_to admin_user_path(@user), notice: "ユーザー情報を更新しました"
      else
        # 更新に失敗した場合こっち
        # 編集画面を出力する
        render :edit
      end
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to admin_users_path, notice: "ユーザーを削除しました"
    end

    private

    def user_params
        params.require(:user).permit(:last_name, :first_name, :gender, :email, :tel_number)
    end
  end
end
