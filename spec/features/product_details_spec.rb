require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js:true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )      
    end
  end
  
  scenario "they click on a product to see the product page" do
    visit root_path
    expect(page).to have_css 'article.product', count: 10
    find('article h4', match: :first).click
    expect(page).to have_css '.products-show', count: 1
  end
end
