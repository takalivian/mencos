class CategoriesController < ApplicationController

  def index
    @categories = Category.where(ancestry: nil)
    @category = Category.find_by(id: params[:id])
  end
  
end
