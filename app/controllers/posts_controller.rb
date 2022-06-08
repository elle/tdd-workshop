class PostsController < ApplicationController
  before_action :require_login, except: [:show]

  def create
    @post = Post.create(
      post_params.merge(person: current_user, published_on: Date.current),
    )

    respond_with @post
  end

  def new
    @post = Post.new
  end

  def show
    @post_presenter = PostPresenter.new(post)
  end

  private

  def post
    @post ||= Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:body, :title)
  end
end
