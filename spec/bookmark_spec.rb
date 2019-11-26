require './lib/bookmark'

describe Bookmark do
  it 'returns an array of web addresses' do
  expect(Bookmark.all).to eq ["http://www.makersacademy.com", "http://www.google.com", "http://www.destroyallsoftware.com"]
  end
end
