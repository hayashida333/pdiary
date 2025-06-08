module Admin
  class AdminPostsController < ApplicationController

    def index
      @admin_posts = AdminPost.all
    end

    def new
      @admin_post = AdminPost.new
    end

    def create
      @admin_post = current_user.admin_posts.build(post_params)
      if @admin_post.save
        redirect_to admin_posts_path, notice: "作成しました"
      else
        render :new
      end
    end

    def update
      @admin_post = AdminPost.find(params[:id])
      if @admin_post.update(post_params)
        redirect_to admin_posts_path, notice: "更新しました"
      else
        render :edit
      end
    end

    private

    def post_params
      params.require(:admin_post).permit(:title, :content)
    end

  end # ← AdminPostsController クラスの end
end   # ← Admin モジュールの end
