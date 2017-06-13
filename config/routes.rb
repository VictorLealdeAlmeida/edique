Rails.application.routes.draw do
  resources :post_attachments
  resources :posts
  get 'sessions/new'

#login
  get    '/login',   to: 'sessions#new', as:'login'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy', as: 'logout'
  get '/denied',to: 'sessions#on_denied',as: 'denied'

  resources :users
  #resources :tasks
  resources :projects, :path => '/' do
    resources :tasks do
   		post '/addMemberTask/:uid' => 'tasks#addMemberTask', as: 'addMemberTask'
    end
    post '/addMember/:uid' => 'projects#addMember', as: 'addMember'
    post '/finish' => 'projects#finish_project', as: 'finish'
    get '/report' => 'projects#get_report', as: 'report'
  end

  # root to '#projects#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
