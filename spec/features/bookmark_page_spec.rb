feature 'Visit bookmark page' do
  scenario 'User can view bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://bbc.co.uk"
    expect(page).to have_content "http://www.github.com"
  end
end
