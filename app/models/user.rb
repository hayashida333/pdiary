class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

validates :gender, inclusion: { in: ["男", "女"], message: "は男または女を選んでください" }
has_many :quiz_results
end