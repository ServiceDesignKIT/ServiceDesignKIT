class Api::V1::SubCategoriesController < Api::ApplicationController

  before_action :find_category, only: [:index]

  respond_to :json


  def index
    @sub_categories = @category.sub_categories

    render json: { sub_categories: @sub_categories }, status: 200
  end


  private

    def find_category
      @category = Category.find(params[:category_id])
    end

end
