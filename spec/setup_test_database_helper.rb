require 'pg'

def clear_table
  connection = PG.connect( dbname: 'bookmark_manager_test' )
  result = connection.exec "TRUNCATE TABLE bookmarks;"
end
