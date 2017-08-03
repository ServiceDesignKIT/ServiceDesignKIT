class Api::V1::FavoritesController < Api::ApplicationController
  before_action :authorize!
  respond_to :json

  def index
    favorites = current_user.favorite_posts.includes(categories: :sub_categories)

    render json: favorites,
           root: :favorites,
           each_serializer: PostSerializer,
           status: 200
  end

  def create
    favorite = current_user.favorites.build(post_id: params[:post_id])

    if favorite.save
      render json: favorite.as_json,
             status: 201
    else
      render json:  { errors: favorite.errors.full_messages }, status: 400
    end
  end


  def destroy
    favorite = current_user.favorites.find_by(post_id: params[:id])

    if favorite && favorite.destroy
      head 204
    else
      head 404
    end
  end

end
