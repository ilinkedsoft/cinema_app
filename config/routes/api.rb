namespace :api do
  namespace :v1 do
    resources :movies, only: [:index, :show] do
      member do
        get :details, to: "movies#details"
      end

      resources :ratings, only: [:index, :create] do
        collection do
          post :leave_review, to: "ratings#create"
        end
      end
    end
  end
end
