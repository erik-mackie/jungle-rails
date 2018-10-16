require 'rails_helper'

RSpec.feature "Visitor can add item to cart", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    1.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They can click add to cart button" do
    # ACT
    visit root_path


    first('article.product').find_button('Add').click

    # DEBUG
    sleep 2
    save_screenshot

  end
end

