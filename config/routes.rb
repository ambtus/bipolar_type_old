BipolarType::Application.routes.draw do

  # The priority is based upon order of creation:
  # first created -> highest priority.

  match 'discover/:id' => 'discover#show', :as => :discover
  match 'type/:id' => 'type#show', :as => :type

  root :to => "type#show", :id => :start
  # See how all your routes lay out with "rake routes"

end
