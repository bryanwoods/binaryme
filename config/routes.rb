ActionController::Routing::Routes.draw do |map|
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.resources :users
  
  map.resources :questions
  
  map.activate_question '/questions/activate/:id', :controller => 'questions', :action => 'activate'

  map.resource :session

  map.root :controller => "main_pages", :action => "home"

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
