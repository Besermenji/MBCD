Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' },
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  get 'hello_world', to: 'hello_world#index'
  authenticated :user do
    root 'hello_world#index'
  end
  root to: redirect('/login')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
