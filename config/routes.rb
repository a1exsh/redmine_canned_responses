routedef = Proc.new do
  resources :canned_responses do
    post :preview, :on => :collection
    get :insert, :on => :member
  end
end

scope '/projects/:project_id', :as => 'per_project' do
  routedef.call
end

routedef.call
