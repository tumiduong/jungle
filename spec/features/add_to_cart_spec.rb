require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
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

  scenario "clicking add to cart will increase cart by one" do
    visit root_path
    expect(page).to have_css 'article.product', count: 10
    first('.actions').click_button 'Add'
    expect(page).to have_content('My Cart (1)')
    save_screenshot
  end
end
