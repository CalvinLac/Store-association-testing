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
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update ({:first_name => params[:user][:first_name]})
    @user.update ({:last_name => params[:user][:last_name]})
    @user.update ({:email => params[:user][:email]})
    redirect_to portals_path
  end

  def destroy
    @product = Product.find(params[:id])
    redirect_to portalproducts_path
    @product.destroy
  end
end
