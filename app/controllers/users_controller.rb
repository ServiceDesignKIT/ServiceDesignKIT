class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:edit, :update]	
	# check if users is editing/updating his own profile
	before_action :check_authorization, only: [:edit, :update]
	# after checks, instanciate user
	before_action :set_user
	def show
		# fetch user from database and assign it to @user
		@user = User.find(params[:id])
	end

	def edit

	end

	def update
		if @user.update(user_params)
			redirect_to @user
		else
			flash.now[:alert] = "Something went wrong. Please try again"
			render :edit 
		end
	end

	private

	def check_authorization
		unless current_user.id == params[:id].to_i
			redirect_to root_url
		end
	end

	def set_user
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:username, :avatar)
	end

 end
