Rails.application.routes.draw do
  get '/models/:model_slug/model_types' => 'model_types#index', defaults: { format: :json }
end
