require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
  it 'should have a name that exists' do
    @category = Category.create
    @product = Product.new(price: 15000 , quantity: 2 , category_id: @category.id ) #missing value name
    expect(@product).to_not be_valid
    # byebug 
    expect(@product.errors.full_messages).to include("Name can't be blank")
    # expect(@product.errors.full_messages.count).to be = 0 
    #count gives length of array and we have to check if it has at least one error.
  end

    it 'should have a price that is not blank' do
      @category = Category.create
      @product = Product.new(name: "Product X",  quantity: 2 , category_id: @category.id ) #missing value price
      # expect(@product.valid?).to be false
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include ("Price can't be blank")
    end

  it 'should have a quantity that exists' do
    @category = Category.create
    @product = Product.new(name: "Product X", price: 15000 , category_id: @category.id ) #missing value quantity
    expect(@product).to_not be_valid
    expect(@product.errors.full_messages).to include ("Quantity can't be blank")
  end

  it 'should have a its own category that exists' do
    @category = Category.create

    @product = Product.new(name: "Product X", price: 15000, quantity: 2 ) #missing value category
    expect(@product).to_not be_valid
    expect(@product.errors.full_messages).to include ("Category can't be blank")
  end

  it 'should save successfully with all 4 fields by AR' do
    @category = Category.create
    @product = Product.new(name: "Toyota", price: 15000 , quantity: 2 , category_id: @category.id ) # Created new product car. NO missing values

    @product.save! 
    expect(@product).to be_valid
    end
  end
end
