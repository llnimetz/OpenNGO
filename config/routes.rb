OpenNGO::Application.routes.draw do
  
  match 'user/:profile' => 'User#profile', :via => :post 
  


  scope "(:locale)", :locale => /en|es/ do
  	devise_for :users, :controllers => { :registrations => "registrations" }
    root to: 'orgs#index'
    resources :orgs, only:[:index,:show, :new, :create] do 
        get 'search', on: :collection
    end
  end 

end 

