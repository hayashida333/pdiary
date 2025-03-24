class Quiz < ApplicationRecord
    has_many :quiz_questions  # Quizには複数のQuizQuestionが関連付けられる
end
