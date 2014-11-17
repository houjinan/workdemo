require 'rails_helper'

RSpec.describe Cart, :type => :model do
  it "add product to cart" do
    #cart = Cart.create()
    cart=create :cart
    product = Product.create()
    lineitem = cart.add_product product.id
    expect(lineitem.product_id).to eq(product.id)
  end
end