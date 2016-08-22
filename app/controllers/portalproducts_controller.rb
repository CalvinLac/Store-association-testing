class PortalproductsController < ApplicationController

  def index
    @products = Product.find_by_sql ["SELECT products.name AS productname, 
      products.description AS productdesc, products.id, price, categories.name AS catdesc
      from products JOIN categories ON (category_id=categories.id) 
      ORDER BY products.name DESC"]
  end

  def show
    @product = Product.find(params[:id]) 

  end

  def edit
    @product = Product.find(params[:id]) 
  end

  def update
    @product = Product.find(params[:id]) 
    @product.update ({:name => params[:product][:name]})
    @product.update ({:description => params[:product][:description]})
    @product.update ({:price => params[:product][:price]})
    redirect_to portalproducts_path
  end

  def destroy
    @product = Product.find(params[:id])
    redirect_to portalproducts_path
    @product.destroy
  end
end
