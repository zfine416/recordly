Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: "users/registrations", sessions: "users/sessions" }
  root 'welcome#index'
  get '/users/:user_id/user_albums/data' => "user_albums#data"

  authenticate :user do
    resources :songs
    resources :albums
    resources :artists
    resources :user_albums
    get '/search' =>'search#index'
  end
end

#                   Prefix Verb   URI Pattern                                Controller#Action
#         new_user_session GET    /users/sign_in(.:format)                   users/sessions#new
#             user_session POST   /users/sign_in(.:format)                   users/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)                  users/sessions#destroy
#            user_password POST   /users/password(.:format)                  devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)              devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)             devise/passwords#edit
#                          PATCH  /users/password(.:format)                  devise/passwords#update
#                          PUT    /users/password(.:format)                  devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)                    users/registrations#cancel
#        user_registration POST   /users(.:format)                           users/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)                   users/registrations#new
#   edit_user_registration GET    /users/edit(.:format)                      users/registrations#edit
#                          PATCH  /users(.:format)                           users/registrations#update
#                          PUT    /users(.:format)                           users/registrations#update
#                          DELETE /users(.:format)                           users/registrations#destroy
#                     root GET    /                                          welcome#index
#                          GET    /users/:user_id/user_albums/data(.:format) user_albums#data
#                    songs GET    /songs(.:format)                           songs#index
#                          POST   /songs(.:format)                           songs#create
#                 new_song GET    /songs/new(.:format)                       songs#new
#                edit_song GET    /songs/:id/edit(.:format)                  songs#edit
#                     song GET    /songs/:id(.:format)                       songs#show
#                          PATCH  /songs/:id(.:format)                       songs#update
#                          PUT    /songs/:id(.:format)                       songs#update
#                          DELETE /songs/:id(.:format)                       songs#destroy
#                   albums GET    /albums(.:format)                          albums#index
#                          POST   /albums(.:format)                          albums#create
#                new_album GET    /albums/new(.:format)                      albums#new
#               edit_album GET    /albums/:id/edit(.:format)                 albums#edit
#                    album GET    /albums/:id(.:format)                      albums#show
#                          PATCH  /albums/:id(.:format)                      albums#update
#                          PUT    /albums/:id(.:format)                      albums#update
#                          DELETE /albums/:id(.:format)                      albums#destroy
#                  artists GET    /artists(.:format)                         artists#index
#                          POST   /artists(.:format)                         artists#create
#               new_artist GET    /artists/new(.:format)                     artists#new
#              edit_artist GET    /artists/:id/edit(.:format)                artists#edit
#                   artist GET    /artists/:id(.:format)                     artists#show
#                          PATCH  /artists/:id(.:format)                     artists#update
#                          PUT    /artists/:id(.:format)                     artists#update
#                          DELETE /artists/:id(.:format)                     artists#destroy
#              user_albums GET    /user_albums(.:format)                     user_albums#index
#                          POST   /user_albums(.:format)                     user_albums#create
#           new_user_album GET    /user_albums/new(.:format)                 user_albums#new
#          edit_user_album GET    /user_albums/:id/edit(.:format)            user_albums#edit
#               user_album GET    /user_albums/:id(.:format)                 user_albums#show
#                          PATCH  /user_albums/:id(.:format)                 user_albums#update
#                          PUT    /user_albums/:id(.:format)                 user_albums#update
#                          DELETE /user_albums/:id(.:format)                 user_albums#destroy