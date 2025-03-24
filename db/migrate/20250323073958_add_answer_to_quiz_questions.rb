class AddAnswerToQuizQuestions < ActiveRecord::Migration[7.2]
  def change
    add_column :quiz_questions, :answer, :string
  end
end
