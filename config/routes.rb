Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tax_bill#home'
  post '/saveitem', to: 'tax_bill#save_item'
  get '/viewbills', to: 'tax_bill#get_bills'
end
