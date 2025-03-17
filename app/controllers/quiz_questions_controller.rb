class QuizQuestionsController < ApplicationController
  before_action :set_quiz_question, only: %i[show answer]

  def show
    # ここでは特に処理しません
  end

  def answer
    # ユーザーが選んだオプションを受け取る
    selected_option = params[:option].to_i

    # 正解と比較して結果を表示
    if selected_option == @quiz_question.correct
      flash[:notice] = "正解です！"
    else
      flash[:alert] = "不正解です。もう一度挑戦してください。"
    end

    # クイズ詳細ページにリダイレクト
    redirect_to @quiz_question
  end

  private

  def set_quiz_question
    @quiz_question = QuizQuestion.find(params[:id])
  end
end
