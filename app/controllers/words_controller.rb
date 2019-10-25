class WordsController < ApplicationController
  def index
    if params[:category]
      @category = Category.find(params[:category])
      @words = @category.answers
    else
      @words = current_user.answers
    end
      @categories = current_user.categories.left_outer_joins(:lessons).where.not(lessons: {result: nil})
  end
end
