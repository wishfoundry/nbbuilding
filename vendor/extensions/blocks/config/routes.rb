Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :blocks do
    resources :blocks, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :blocks, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :blocks, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
