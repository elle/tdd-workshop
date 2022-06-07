module Api
  module V1
    class PostsController < ApplicationController
      def index
        render json: Post.all
      end
    end
  end
end
