class QuizQuestionsController < ApplicationController
  before_action :set_quiz_question, only: %i[show answer edit update destroy]

  def index
    @quiz_questions = QuizQuestion.all
  end

  def new
    @quiz_question = QuizQuestion.new
  end

  def create
    @quiz_question = QuizQuestion.new(quiz_question_params)
    if @quiz_question.save
      redirect_to @quiz_question, notice: "クイズを作成しました"
    else
      render :new
    end
  end

  def edit
    # @quiz_question は set_quiz_question で取得済み
  end

  def update
    if @quiz_question.update(quiz_question_params)
      redirect_to @quiz_question, notice: '更新に成功しました'
    else
      render :edit
    end
  end

  def destroy
    @quiz_question.destroy
    redirect_to quiz_questions_path, notice: "削除しました"
  end

  def show
    # 詳細表示用（set_quiz_questionで取得済み）
  end

  def answer
    selected = params[:selected_option].to_i

    if selected == @quiz_question.correct
      flash[:notice] = "正解です！"
    else
      flash[:alert] = "不正解です。正解は「#{@quiz_question.send("option#{@quiz_question.correct}")}」です。"
    end

    redirect_to quiz_question_path(@quiz_question)
  end

  private

  def set_quiz_question
    @quiz_question = QuizQuestion.find(params[:id])
  end

  def quiz_question_params
    params.require(:quiz_question).permit(:question, :option1, :option2, :option3, :option4, :correct)
  end
end
