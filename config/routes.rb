Rails.application.routes.draw do
  root 'static_pages#hello'
  resources :books
  resources :authors
  get '/dewey', to: 'static_pages#dewey'
  get '/books/search/:searchtopic/:searchvalue', to: 'books#search'
  post '/books/:id/newauthor',to: 'books#newauthor'
  post '/books/:id/existingauthor',to: 'books#existingauthor'
end