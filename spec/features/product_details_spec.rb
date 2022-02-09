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
    puts page.html

    # page.find("btn btn-default pull-right").find_button('Details »').click #TESTED -->ERROR: Failure/Error: page.find("btn btn-default pull-right").find_button('Details »').click
    # Capybara::ElementNotFound:
    #   Unable to find css "btn btn-default pull-right"

    # click_link('class="btn btn-default pull-right" href="/products/12">Details »') #ElementNotFound:

    # page.find_button 'Details »'  #Unable to find button "Details »" that is not disabled

    # page.find_link 'product'.click
    # page.has_selector? :link, 'btn btn-default pull-right ', href: ‘/products/id’

    # page.find('#btn-default pull-right').find_link(`Details »`).click

    # page.find('article class=product').find_link(`href="/products/2"`).click

    # find('.actions').first(:link, "Details").click #ambiguous
    find('.product', match: :first).click_link("Details")
    sleep 2
    save_and_open_screenshot "product_details.png"
    product = find('.products-show')
    expect(product).to have_css(".product-detail") #have_css method looks into the children css to find a match for the expect(parent) 
      
  end

end
