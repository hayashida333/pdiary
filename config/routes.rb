Rails.application.routes.draw do
  # Devise（ログイン認証）
  devise_for :users

  # トップページを /posts にリダイレクト
  root to: redirect('/posts')

  # 投稿関連
  resources :videos
  resources :posts

  # ユーザー関連（show, index のみ許可し destroy は除外）
  resources :users, only: [:index, :show]

  # クイズ機能
  resources :quiz_questions, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    get 'answer', on: :member
  end

  # ヘルスチェック
  get "up" => "rails/health#show", as: :rails_health_check

  # PWA用ファイル
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # 管理者用名前空間
  namespace :admin do
    resources :users
  end
end

