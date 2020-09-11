feature 'Visitor can edit articles' do
  let(:test_article) { FactoryBot.create(:article, title: 'Hello world', content: 'The world is awesome')}
  before do
    visit article_path(test_article)
    click_on 'Edit Article'
    fill_in 'Title', with: 'This is a better title'
    click_on 'Update Article'
  end

  describe 'Visitor can edit an article' do
    it 'and it displays a success message' do
      expect(page).to have_content 'The article was successfully updated'
    end
    
    it 'and displays the updated article' do
      expect(page).to have_content 'This is a better title'
    end
  end
end