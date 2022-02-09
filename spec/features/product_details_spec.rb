require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        price: 64.99
      )
    end
  end
  scenario "They see all products" do
    visit root_path 
    save_and_open_screenshot
    puts page.html
    page.find("btn btn-default pull-right").find_button('Details »').click
    save_and_open_screenshot
      # click_link('<a class="btn btn-default pull-right" href="/products/12">Details »')
</a>

end
