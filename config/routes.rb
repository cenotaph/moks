Moks::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'

  devise_for :users, :controllers => {:registrations => "registrations"}

  resources :projectproposals

  resources :residencyapplications



  namespace :admin do
    resources :artists do
      resources :visits
    end
    resources :budgetareas
    resources :contacts
    resources :documenttypes
    resources :documents
    resources :events
    resources :expenses
    resources :funders
    resources :images
    resources :incomes
    resources :invoices do
      resources :incomes
    end
    resources :locations
    resources :pages
    resources :postcategories
    resources :posts
    resources :projects
    resources :projecttypes
    resources :publicities
    resources :registrations
    resources :residencytypes
    resources :sounds
    resources :users
    resources :visits
  end

  wiki_root '/admin/wiki'
 
  match '/admin' => 'admin/home#index'

  match 'auth/:provider/callback' => 'authentications#create'
  match '/oauth/authenticate' => 'authentications#create'
  resources :authentications
  root :to => "application#home"
  
  resources :users


end