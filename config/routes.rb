RepertoireFacetingExample::Application.routes.draw do

  path_prefix = RepertoireFacetingExample::Application.config.repertoire_assets.path_prefix

  scope path_prefix do
    faceting_for :nobelists, :citizens         # NB must be BEFORE any resources!    
    
    get ':controller(/:action(/:id(.:format)))'
  end
  
  root :to => 'nobelists#index'
end
