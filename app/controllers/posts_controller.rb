class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :require_admin, only: %i[edit update destroy new create] # newとcreateも管理者権限を要求

  def index
    @posts = Post.all
    @quiz_questions = QuizQuestion.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
  @post = Post.new(post_params)
  url = params[:post][:youtube_url]
  url = url.last(11)
  @post.youtube_url = url

  respond_to do |format|
    if @post.save
      format.html { redirect_to @post, notice: "投稿が正常に作成されました。" }
      format.json { render :show, status: :created, location: @post }
    else
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @post.errors, status: :unprocessable_entity }
    end
  end
end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: "投稿が正常に更新されました。" }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_path, status: :see_other, notice: "投稿が正常に削除されました。" }
      format.json { head :no_content }
    end
  rescue ActiveRecord::RecordNotDestroyed => e
    respond_to do |format|
      format.html { redirect_to posts_path, alert: "投稿の削除に失敗しました: #{e.message}" }
      format.json { render json: { error: e.message }, status: :unprocessable_entity }
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:body, :youtube_url)
  end

  # 管理者権限をチェックするメソッドを追加
  def require_admin
    # ここでは current_user が存在し、かつ admin が true であることを確認します。
    # current_user メソッドは、ユーザー認証システム (例: Devise) によって提供されていると仮定します。
    unless current_user && current_user.admin?
      redirect_to posts_path, alert: "管理者権限がありません。"
    end
  end
end