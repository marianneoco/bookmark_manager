require 'sinatra/base'
require './lib/bookmark'

class BookmarkApp < Sinatra::Base
  get '/' do
    "You've found homepage!"
  end

  get '/bookmarks' do
    @list = Bookmark.all
    erb :'bookmarks/index'
  end
    # start the server if the ruby file executed directly
    run! if app_file == $0
end
