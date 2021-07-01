ActiveAdmin.register Movie do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :imdb_id, :starts, :ends, :price, :currency
  #
  # or
  #
  permit_params do
    permitted = %i[title imdb_id starts ends price currency]
    permitted
  end

  form do |f|
    f.inputs 'Details' do
      f.input :title, label: 'Title'
      f.input :imdb_id, label: 'imdb ID'
      f.input :price, label: 'Price'
      f.input :currency, label: 'Currency', as: :select, collection: %w[USD Euro]
      f.input :starts, as: :datepicker, label: 'Start Date'
      f.input :ends, as: :datepicker, label: 'End Date'
    end
    f.actions
  end
end
