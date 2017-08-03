class Api::V1::CommentsController < Api::ApplicationController
  before_action :set_post
  respond_to :json

  def create
    @comment = @post.comments.build(comment_params)

    if @comment.save
      render json: @comment,
             serialiser: CommentSerializer,
             status: 201
    else
      render json: { errors: @comment.errors.full_messages }, status: 400
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])

    unless @comment.delete
      render json: { errors: @comment.errors.full_messages }, status: 400
    end
  end


  private

    def comment_params
      attrs = params.permit(:content)
      attrs[:user] = current_user
      attrs
    end

    def set_post
      @post = Post.find(params[:post_id])
    end
end

