Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get("/forex", {:controller => "forex", :action => "first_currency_list"})
  get("/forex/:user_currency_one", { :controller => "forex", :action => "second_currency_list"})



end
