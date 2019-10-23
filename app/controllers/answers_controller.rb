class AnswersController < ApplicationController

  def new
    @lesson = Lesson.find(params[:lesson_id])
    @category = @lesson.category

    if @lesson.next_word.nil?
      @lesson.update_attribute(:result, @lesson.correct_answers)
      @lesson.create_activity(user: current_user)
      redirect_to lesson_url(@lesson)
    else
      @answer = @lesson.answers.new
    end
  end

  def create
    @lesson = Lesson.find(params[:lesson_id])
    @answer = @lesson.answers.new(answer_params)

    if @answer.save
      redirect_to new_lesson_answer_url(@lesson)
    end

  end

  private
  def answer_params
    params.require(:answer).permit(:word_id, :lesson_id, :choice_id)
  end
end
