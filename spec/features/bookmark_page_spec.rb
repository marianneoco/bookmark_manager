require 'pg'

feature 'Visit bookmark page' do
  scenario 'User can view bookmarks' do
    connection = PG.connect( dbname: 'bookmark_manager_test' )
    result = connection.exec "INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com', 'Makers');"
    result = connection.exec "INSERT INTO bookmarks VALUES(2, 'http://www.google.com', 'Google');"
    result = connection.exec "INSERT INTO bookmarks VALUES(3, 'http://www.destroyallsoftware.com', 'Destroy All Software');"
    visit('/bookmarks/new')
    #can't directly visit bookmarks anymore as it's a post request.
    #need to visit /bookmarks/new and then click submit (submit empty form)
    click_button("SUBMIT")
    expect(page).to have_link("Makers", href: "http://www.makersacademy.com")
    expect(page).to have_link("Google", href: "http://www.google.com")
    expect(page).to have_link("Destroy All Software", href: "http://www.destroyallsoftware.com")
  end
end
