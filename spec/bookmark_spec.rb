require './lib/bookmark'
require 'pg'

describe Bookmark do
  it 'returns an array of web addresses' do
    connection = PG.connect( dbname: 'bookmark_manager_test' )
    result = connection.exec "INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');"
    result = connection.exec "INSERT INTO bookmarks VALUES(2, 'http://www.google.com');"
    result = connection.exec "INSERT INTO bookmarks VALUES(3, 'http://www.destroyallsoftware.com');"
    expect(Bookmark.all).to eq ["http://www.makersacademy.com", "http://www.google.com", "http://www.destroyallsoftware.com"]
  end

  it "can create a new bookmark with a URL and title" do
    connection = PG.connect( dbname: 'bookmark_manager_test' )
    Bookmark.create("http://www.bbc.co.uk", "BBC")
    expect(Bookmark.all).to include "http://www.bbc.co.uk"
    expect(Bookmark.all).to include "BBC"
  end
end
