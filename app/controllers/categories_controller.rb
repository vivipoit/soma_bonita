class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @tours = @category.tours.all.order("name ASC")
  end
end
