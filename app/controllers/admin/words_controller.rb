class Admin::WordsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @words = @category.words.paginate(page: params[:page], per_page: 5)
  end

  def new
    @category = Category.find(params[:category_id])
    @word = @category.words.new
    3.times { @word.choices.build }
  end

  def create
    @category = Category.find(params[:category_id])
    @word = @category.words.new(words_params)
    if @word.save
      redirect_to admin_category_words_url
    else
      render "new"
    end
  end

  def edit
    @category = Category.find(params[:category_id])
    @word = Word.find(params[:id])
  end

  def update
    @category = Category.find(params[:category_id])
    @word = Word.find(params[:id])
    if @word.update(words_params)
      redirect_to admin_category_words_url
    else
      render "edit"
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    @word = Word.find(params[:id])
    @word.destroy

    redirect_to admin_category_words_url
  end

  private
  def words_params
    params.require(:word).permit(:content, choices_attributes: [:id, :content, :is_correct])
  end
end