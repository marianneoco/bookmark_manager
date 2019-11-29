require './lib/bookmark'
require 'pg'

describe Bookmark do

  it "can create a new bookmark" do
    bookmark = Bookmark.new(1, "http://www.bbc.co.uk", "BBC")
    expect(bookmark).to be_instance_of(Bookmark)
  end

  it "can create a new bookmark with a url" do
    bookmark = Bookmark.new(1, "http://www.bbc.co.uk", "BBC")
    expect(bookmark.url).to eq("http://www.bbc.co.uk")
  end

  it "can create a new bookmark with a title" do
    bookmark = Bookmark.new(1, "http://www.bbc.co.uk", "BBC")
    expect(bookmark.title).to eq("BBC")
  end

  it "can create a new bookmark with an id" do
  bookmark = Bookmark.new(1, "http://www.bbc.co.uk", "BBC")
    expect(bookmark.id).to eq(1)
  end

  it "it has an all method which returns an array of web addresses" do
    connection = PG.connect( dbname: 'bookmark_manager_test' )
    result = connection.exec "INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com', 'Makers');"
    expect(Bookmark.all).to be_instance_of(Array)
    expect(Bookmark.all[0].url).to eq('http://www.makersacademy.com')
    expect(Bookmark.all[0].title).to eq('Makers')
  end

  it "can create a new entry in the database" do
    Bookmark.create("http://www.bbc.co.uk", "BBC")
    expect(Bookmark.all[0]).to be_instance_of(Bookmark)
  end

  it "can delete a bookmark" do
    bookmark = Bookmark.create("http://www.bbc.co.uk", "BBC")
    Bookmark.delete(bookmark.id)
    expect(Bookmark.all).to eq []
  end

end
