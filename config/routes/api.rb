namespace :api do
  namespace :v1 do
    resources :movies, only: [:index, :show] do
      resources :ratings, only: [:index, :create] do
        collection do
          post :leave_review, to: "ratings#create"
        end
      end
    end
  end
end
