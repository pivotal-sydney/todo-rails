Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope '/api/v1' do
    resources :tasks, :only => [:index, :create, :update]
  end
end
