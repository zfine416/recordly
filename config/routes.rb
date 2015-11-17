Rails.application.routes.draw do
  # devise_for :users
  # resources :songs
  resources :albums
  # resources :artists
  devise_for :users, controllers: { registrations: "users/registrations", sessions: "users/sessions" }
  root 'welcome#index'
  get '/users/:user_id/user_albums/data' => "user_albums#data"

  resources :users do
    resources :user_albums
    resources :songs
    resources :artists

    # get '/search' =>'search#index'
    # get '/songs/:id' => 'songs#show'
    # get 'favorites', to: 'favorites#index'
    # put 'favorites', to: 'favorites#create'
  end
end

#                   Prefix Verb   URI Pattern                                    Controller#Action
#                   albums GET    /albums(.:format)                              albums#index
#                          POST   /albums(.:format)                              albums#create
#                new_album GET    /albums/new(.:format)                          albums#new
#               edit_album GET    /albums/:id/edit(.:format)                     albums#edit
#                    album GET    /albums/:id(.:format)                          albums#show
#                          PATCH  /albums/:id(.:format)                          albums#update
#                          PUT    /albums/:id(.:format)                          albums#update
#                          DELETE /albums/:id(.:format)                          albums#destroy
#         new_user_session GET    /users/sign_in(.:format)                       users/sessions#new
#             user_session POST   /users/sign_in(.:format)                       users/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)                      users/sessions#destroy
#            user_password POST   /users/password(.:format)                      devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)                  devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)                 devise/passwords#edit
#                          PATCH  /users/password(.:format)                      devise/passwords#update
#                          PUT    /users/password(.:format)                      devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)                        users/registrations#cancel
#        user_registration POST   /users(.:format)                               users/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)                       users/registrations#new
#   edit_user_registration GET    /users/edit(.:format)                          users/registrations#edit
#                          PATCH  /users(.:format)                               users/registrations#update
#                          PUT    /users(.:format)                               users/registrations#update
#                          DELETE /users(.:format)                               users/registrations#destroy
#                     root GET    /                                              welcome#index
#                          GET    /users/:user_id/user_albums/data(.:format)     user_albums#data
#         user_user_albums GET    /users/:user_id/user_albums(.:format)          user_albums#index
#                          POST   /users/:user_id/user_albums(.:format)          user_albums#create
#      new_user_user_album GET    /users/:user_id/user_albums/new(.:format)      user_albums#new
#     edit_user_user_album GET    /users/:user_id/user_albums/:id/edit(.:format) user_albums#edit
#          user_user_album GET    /users/:user_id/user_albums/:id(.:format)      user_albums#show
#                          PATCH  /users/:user_id/user_albums/:id(.:format)      user_albums#update
#                          PUT    /users/:user_id/user_albums/:id(.:format)      user_albums#update
#                          DELETE /users/:user_id/user_albums/:id(.:format)      user_albums#destroy
#               user_songs GET    /users/:user_id/songs(.:format)                songs#index
#                          POST   /users/:user_id/songs(.:format)                songs#create
#            new_user_song GET    /users/:user_id/songs/new(.:format)            songs#new
#           edit_user_song GET    /users/:user_id/songs/:id/edit(.:format)       songs#edit
#                user_song GET    /users/:user_id/songs/:id(.:format)            songs#show
#                          PATCH  /users/:user_id/songs/:id(.:format)            songs#update
#                          PUT    /users/:user_id/songs/:id(.:format)            songs#update
#                          DELETE /users/:user_id/songs/:id(.:format)            songs#destroy
#             user_artists GET    /users/:user_id/artists(.:format)              artists#index
#                          POST   /users/:user_id/artists(.:format)              artists#create
#          new_user_artist GET    /users/:user_id/artists/new(.:format)          artists#new
#         edit_user_artist GET    /users/:user_id/artists/:id/edit(.:format)     artists#edit
#              user_artist GET    /users/:user_id/artists/:id(.:format)          artists#show
#                          PATCH  /users/:user_id/artists/:id(.:format)          artists#update
#                          PUT    /users/:user_id/artists/:id(.:format)          artists#update
#                          DELETE /users/:user_id/artists/:id(.:format)          artists#destroy
#                    users GET    /users(.:format)                               users#index
#                          POST   /users(.:format)                               users#create
#                 new_user GET    /users/new(.:format)                           users#new
#                edit_user GET    /users/:id/edit(.:format)                      users#edit
#                     user GET    /users/:id(.:format)                           users#show
#                          PATCH  /users/:id(.:format)                           users#update
#                          PUT    /users/:id(.:format)                           users#update
#                          DELETE /users/:id(.:format)                           users#destroy

