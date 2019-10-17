class Word < ApplicationRecord
  has_many :choices, dependent: :destroy
  belongs_to :category
  accepts_nested_attributes_for :choices

  validates :content, presence: true, length: {maximum: 50}
  validate :has_one_correct

  def correct_answer
    choices.find_by(is_correct: true)
    #このメソッドは@word燃えるの中にあるので、
    #使いたい場合は@word = ~~と指定してあるから
    #@ward.correct_answer.contentで使用できる。
  end

  private
    def has_one_correct
      unless choices.collect { |choice| choice.is_correct?}.count(true) == 1
        errors.add(:choices,"Should have 1 correct answer")
      end
    end
end

