ActionController::Routing::Routes.draw do |map|
  map.resources :canned_responses,
    :collection => { :preview => :post, :insert => :post }
  map.resources :canned_responses, :path_prefix => '/projects/:project_id',
    :collection => { :preview => :post, :insert => :post }
end
