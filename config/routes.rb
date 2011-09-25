ActionController::Routing::Routes.draw do |map|
  map.resources :canned_responses,
    :member => { :preview => :any, :insert => :post }
  map.resources :canned_responses, :path_prefix => '/projects/:project_id',
    :member => { :preview => :any, :insert => :post }
end
