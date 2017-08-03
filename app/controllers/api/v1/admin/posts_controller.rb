class Api::V1::Admin::PostsController < Api::V1::Admin::BaseController

  before_action :find_post, only: [:show, :update, :destroy]

  respond_to :json

  def index
    posts = Post.all
    render json: posts, status: 200
  end

  def show
    render json: @post, status: 200
  end

  def update
    status = \
      case params[:status]
      when :publishe.to_s
        :published
      when :decline.to_s
        :declined
      else
        :pending
      end

    if @post.update_attributes(status: status)
      render json: @post,
             serializer: ::Admin::PostSerializer,
             status: 200
    else
      render json: @post.errors.full_messages, status: 400
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

end
