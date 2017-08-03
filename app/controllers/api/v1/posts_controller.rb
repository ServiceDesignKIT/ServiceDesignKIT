class Api::V1::PostsController < Api::ApplicationController

  before_action :find_post, only: [:show, :update, :destroy]

  respond_to :json

  def index
    posts = Post.published.includes(categories: :sub_categories)
    render json: posts, status: 200
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      render json: @post, status: 201
    else
      render json: { errors: @post.errors.full_messages }, status: 400
    end
  end

  def update
    if @post.update(post_params)
      @post.update(status: :pending)
      render json: @post, status: 200
    else
      render json: { errors: @post.errors.full_messages }, status: 400
    end
  end

  def destroy

    unless @post.destroy
      render json: @post.errors.full_messages, status: 400
    end
  end

  private

    def find_post
      @post = Post.find_by(id: params[:id])
    end

    def post_params
      params.permit(:title,
                    :body,
                    :image,
                    :instruction,
                    :references,
                    subcategory_list: [],
                    freetag_list: [])
    end

end
