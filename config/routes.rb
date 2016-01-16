Rails.application.routes.draw do
  get  '/models/:model_slug/model_types' => 'model#index', defaults: { format: :json }
  post '/models/:model_slug/model_types_price/:model_type_slug' => 'model_types#update', defaults: { format: :json }
end
