require 'pg'

feature 'Visit bookmark page' do
  scenario 'User can view bookmarks' do
    connection = PG.connect( dbname: 'bookmark_manager_test' )
    connection.exec "INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com', 'Makers');"
    connection.exec "INSERT INTO bookmarks VALUES(2, 'http://www.google.com', 'Google');"
    connection.exec "INSERT INTO bookmarks VALUES(3, 'http://www.destroyallsoftware.com', 'Destroy All Software');"
    visit('/bookmarks')
    expect(page).to have_link("Makers", href: "http://www.makersacademy.com")
    expect(page).to have_link("Google", href: "http://www.google.com")
    expect(page).to have_link("Destroy All Software", href: "http://www.destroyallsoftware.com")
  end

  scenario 'User can delete a bookmark' do
    connection = PG.connect( dbname: 'bookmark_manager_test' )
    connection.exec "INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com', 'Makers');"
    connection.exec "INSERT INTO bookmarks VALUES(2, 'http://www.google.com', 'Google');"
    connection.exec "INSERT INTO bookmarks VALUES(3, 'http://www.destroyallsoftware.com', 'Destroy All Software');"
    visit('/bookmarks')
    fill_in('title', with:"Makers")
    click_button("DELETE")
    expect(page).to_not have_link("Makers", href: "http://www.makersacademy.com")
  end
end
