Rails.application.routes.draw do
  devise_for :users
  get 'posts/index'
  get 'posts/new'
  get 'posts/show'
  get 'posts/edit'
  get 'home', to: 'home#home_page', as: :home
  root to: redirect('home')
  resources :posts do
    resources :comments
  end

end
