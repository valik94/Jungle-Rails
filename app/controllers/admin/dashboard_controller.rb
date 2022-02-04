class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: ENV['USERNAME'], password: ENV['PASSWORD']
  

  def show
    @total_products = Product.count
    puts "The total products is: #{@total_products}"
    @total_categories = Category.count
    puts "The total categories is: #{@total_categories}"
  end
end
