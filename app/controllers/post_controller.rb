class PostController < ApplicationController
  def index
    posts = db_user.posts.all
    render json: posts
  end

  def create
    post = db_user.posts.new(post_params)
    if post.save
      render json: {status: 'created'}, status: :created
    else
      render json: {status: 'not created'}, status: :unprocessable_entity
    end
  end

  private
  def post_params
    params.permit(:title, :body)
  end
end
