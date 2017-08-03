class TechniquesController < ApplicationController
before_action :authenticate_user!, except: :show
before_action :check_permission, only: :destroy
before_action :find_post, only: [:show, :edit, :update, :destroy]
before_action :set_all_posts, only: [:show, :new, :edit]
before_action :serilez_post, only: [:show, :edit]
before_action :owner?, only: :destroy

  def index
    @top_five_posts = Post.top_five_posts
  end

	def new
    @categories = Category.limit(5).map do |cat|
      cat.attributes.merge(sub_categories: cat.sub_categories)
    end
	end

	def show
    @categories = collect_categories.select{ |cat| cat[:sub_categories].present? }
	end

	def edit
    @categories = Category.limit(5).map do |cat|
      cat.attributes.merge(sub_categories: cat.sub_categories)
    end
	end

	def update
		if @post.update(post_params)
			redirect_to @post, notice: "Technique was successfully updated"
		else
			render :edit
		end

	end

	def destroy
		@post.destroy
		redirect_to root_path
	end

	def create
		@post = current_user.posts.new(post_params)

    if @post.save
		  redirect_to @post
		else
		  render :new
		end
	end

private

  def owner?
    (current_user.id == find_post.owner) || current_user.is_admin?
  end

  def check_permission
    unless owner?
      redirect_to @post
      flash[:alert] = "You're not owner to manage this post!"
    end
  end

 	def post_params
 		params.require(:post).permit(:title,
                                 :body,
                                 :image,
                                 :instruction,
                                 subcategory_list: [],
                                 freetag_list: [])
 	end

 	def find_post
 		@post = Post.find_by(id: params[:id])
 	end

  def set_all_posts
    @posts = Post.published
  end

  def collect_categories
    Category.limit(5).map do |category|
      subc =  category.sub_categories.select do |s|
        @post.subcategory_list.include? (s.name)
      end
      category = category.attributes.merge(sub_categories: subc.map(&:name) )
      category
    end
  end

  def serilez_post
    @post_json = PostSerializer.new(@post, scope: current_user)
  end

end
