Rails.application.routes.draw do
  # Devise（ログイン認証）
  devise_for :users

  # トップページ（専用ビューを用意した場合）
  root "home#index"

  # 投稿関連（記事・動画）
  resources :posts
  resources :videos

  # クイズ機能
  resources :quiz_questions, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
  post 'answer', on: :member
end

  # ユーザー表示（index, show）
  resources :users, only: [:index, :show]

  # 管理者用名前空間
  namespace :admin do
    resources :users
  end

  # ヘルスチェック
  get "up", to: "rails/health#show", as: :rails_health_check

  # PWA用ファイル
  get "service-worker", to: "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest", to: "rails/pwa#manifest", as: :pwa_manifest
end
