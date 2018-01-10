Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/pdf" => "pdf_resumes#show"
  # get "/test" => "pdf_resumes#test"
end
