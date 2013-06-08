Moks::Application.routes.draw do

  namespace :admin do
    resources :staffcomments
  end


  mount Ckeditor::Engine => '/ckeditor'

  devise_for :users, :controllers => {:registrations => "registrations"}

  resources :projectproposals

  resources :residencyapplications, :path => :applications

  resources :pages
  resources :events
  resources :projects
  resources :posts do
    collection do
      get :news
      get :blog
    end
  end
  resources :artists do
    collection do
      get :past
    end
  end
  

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
    resources :pages do
      collection do
        get :from_slug
      end
    end
    resources :postcategories
    resources :posts
    resources :projects
    resources :projecttypes
    resources :publicities
    resources :registrations
    resources :residencyapplications do
      resources :staffcomments
    end
    resources :residencytypes
    resources :sounds
    resources :users do
      member do 
        get :edit_profile
      end
    end
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