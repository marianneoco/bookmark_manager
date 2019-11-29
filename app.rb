require 'sinatra/base'
require './lib/bookmark'

class BookmarkApp < Sinatra::Base

  enable :method_override

  get '/' do
    "You've found homepage!"
  end

  get '/bookmarks' do
    @list = Bookmark.all
    erb :'bookmarks/index'
  end

  get '/bookmarks/new' do
    erb :'bookmarks/new'
  end

  delete '/bookmarks' do
    Bookmark.delete(params[:id])
    redirect '/bookmarks'
  end

  post '/bookmarks' do
    Bookmark.create(params[:url], params[:title])
    redirect '/bookmarks'
  end

    # start the server if the ruby file executed directly
    run! if app_file == $0
end
