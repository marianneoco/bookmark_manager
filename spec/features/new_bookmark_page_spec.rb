feature 'Add a new bookmark' do

  scenario "User can see a form with a submit button" do
    visit('/bookmarks/new')
    expect(page).to have_selector(:link_or_button, "SUBMIT")
  end

  scenario "User can fill in form with a new bookmark" do
    visit('/bookmarks/new')
    fill_in('url', with: "http://www.facebook.com")
    fill_in('title', with: "Facebook")
    click_button("SUBMIT")
    expect(page).to have_link("Facebook", href: "http://www.facebook.com")
  end
end
