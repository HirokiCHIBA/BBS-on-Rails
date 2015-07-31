class PostsController < ApplicationController
  respond_to :json

  def index
    if params[:last_id].present?
      # 未読分を取得
      respond_with Post.load_newer_than(params[:last_id])
    else
      # 1ページ分を取得
     	respond_with Post.load_page(params[:number].presence || 1)
    end
  end

  def create
    # 保存
    post = Post.create(post_params)

    # イベントを発生
    WebsocketRails[:streaming].trigger "created", post.id

    respond_with post
  end
 
  private
 
  def post_params
    params.require(:post).permit(:author, :content, :mail)
  end
end
