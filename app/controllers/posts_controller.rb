class PostsController < ApplicationController
  def show
    @post_presenter = PostPresenter.new(post)
  end

  private

  def post
    @post ||= Post.find(params[:id])
  end
end
