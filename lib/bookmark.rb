require 'pg'

class Bookmark

  attr_reader :url, :title

  def initialize(url, title)
    @url = url
    @title = title
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect( dbname: 'bookmark_manager_test' )
    else
      connection = PG.connect( dbname: 'bookmark_manager' )
    end
    result = connection.exec "SELECT * FROM bookmarks"
    result.map { |bookmark| Bookmark.new(bookmark['url'], bookmark['title']) }
  end

  def self.create(url, title)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect( dbname: 'bookmark_manager_test' )
    else
      connection = PG.connect( dbname: 'bookmark_manager' )
    end
    connection.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}')")
  end

  def self.delete(title)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect( dbname: 'bookmark_manager_test' )
    else
      connection = PG.connect( dbname: 'bookmark_manager' )
    end
    connection.exec("DELETE FROM bookmarks WHERE title = '#{title}'")
  end
end

#class Bookmark
  #def self.all
    #["http://www.github.com", "http://bbc.co.uk", "http://www.makersacademy.com"]
  #end
#end
