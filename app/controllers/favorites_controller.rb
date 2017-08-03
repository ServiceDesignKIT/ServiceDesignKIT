class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @top_five_posts = Post.top_five_posts
  end

  def create
    favorite = current_user.favorites.build(post_params)

    if favorite.save
      render json: favorite, status: 201
    else
      render json: favorite.errors.full_messages, status: 400
    end
  end

  def destroy
    favorite = current_user.favorites.find(post_params)

    unless favorite.destroy
      render json: favorite.errors.full_messages, status: 400
    end
  end

  private

    def post_params
      params.permit(:post_id)
    end
end