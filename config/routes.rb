Rails.application.routes.draw do
  devise_for :users
  root to: 'tweets#index'
  resources :tweets do
    resources :comments, only: :create
    collection do #collectionとmemberは、ルーティングのURLと実行されるコントローラーを任意にカスタムできます。
      #collectionはルーティングに:idがつかない、memberは:idがつくという違いがあります。
      #今回の検索機能の場合、詳細ページのような:idを指定して特定のページにいく必要がないため、collectionを使用してルーティングを設定しましょう。
      get 'search'
    end
  end
  resources :users, only: :show
end
