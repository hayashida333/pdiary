class QuizQuestionsController < ApplicationController
  before_action :set_quiz_question, only: [:show, :check_answer]
  def index
    @quiz_questions = QuizQuestion.all
  end

  def show
    @quiz_question = QuizQuestion.find(params[:id])
    @quiz = @quiz_question.quiz
    @options = @quiz_question.options # 選択肢を取得
  end

  def check_answer
    selected_option = Option.find(params[:answer])
    if selected_option.is_correct
      flash[:notice] = "正解です！"
    else
      flash[:alert] = "不正解です。"
    end
    redirect_to quiz_question_path(@quiz_question)
  end

  private

  def set_quiz_question
    @quiz_question = QuizQuestion.find(params[:id])
  end
end