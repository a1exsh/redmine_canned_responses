routedef = Proc.new do
  resources :canned_responses do
    collection do
      get :preview
      get :insert
    end
  end
end

scope '/projects/:project_id', :as => 'per_project' do
  routedef.call
end

routedef.call
