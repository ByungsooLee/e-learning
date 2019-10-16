class Admin::WordsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
  end

  def new
    @category = Category.find(params[:category_id])
    @word = @category.words.new
    3.times { @word.choices.new }
  end

  def edit
    @category = Category.find(params[:category_id])
  end
end
