class Admin::CategoriesController < ApplicationController
  def index
    @category = Category.paginate(page: params[:page], per_page: 10)
  end

  def new
    @category = Category.new
  end
end
