RepertoireFacetingExample::Application.routes.draw do

  # path_prefix = RepertoireFacetingExample::Application.config.repertoire_assets.path_prefix

  # Faceting paths

  faceting_for :nobelists, :citizens         # NB must be BEFORE any resources!

  # Application paths

  root :to => 'nobelists#index'
  get ':controller(/:action(/:id(.:format)))'
end
