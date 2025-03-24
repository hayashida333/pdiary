class Option < ApplicationRecord
    belongs_to :quiz_question

    # 属性: option_text, is_correct (正解かどうか)
  end