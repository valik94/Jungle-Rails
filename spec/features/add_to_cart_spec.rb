require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
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

  scenario "Visit home page and click on my_cart" do
    visit root_path
    #check the text rendered in the top nav (by the _top_nav.html.erb partial) changes from "My Cart (0)" to to "My Cart (1)"
    page.find('.product', match: :first).click_button("Add")
    sleep 2
    cart = find(:link, "My Cart").text
    puts 'THIS IS CART ----------- ' + cart
    save_and_open_screenshot "add_to_cart.png"
    expect(cart).to eql("My Cart (1)")

  end
end
