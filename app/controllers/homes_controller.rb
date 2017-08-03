 class HomesController < ApplicationController
	# get all the post
	def show
    @top_five_posts = Post.top_five_posts
	end

 end
