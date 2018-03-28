Rails.application.routes.draw do

  match "200" => "code#code200", via: [:get, :post, :put, :delete]
  match "404" => "code#code404", via: [:get, :post, :put, :delete]
  match "500" => "code#code500", via: [:get, :post, :put, :delete]

end
