class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])
    if !current_cart.items.include?(@product)
      current_cart.add_product_to_cart(@product)
      flash[:notice] ="你已成功將 #{@product.title}加到購物車了"   #Q1  #{}這是什麼意思 A:rails的變數
                                                     #Q2  為什麼不是Product.title A:因為前面已經宣告@product了
    else
      flash[:Warning] ="你的購物車裡已經有此商品"
    end

    redirect_to :back
  end

end
