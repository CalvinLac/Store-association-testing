class PortaladdressesController < ApplicationController
  
  def index
    @users = User.find_by_sql ["SELECT DISTINCT users.id, street_address, 
      zip_code, cities.name AS CityName, states.name AS statename from users JOIN addresses ON (shipping_id=addresses.id)
       JOIN cities ON (city_id=cities.id) JOIN states ON (state_id=states.id) 
       ORDER BY users.id ASC"]
  end

  def show
    @nice = User.find_by_sql ["SELECT DISTINCT users.id, street_address, 
      zip_code, cities.name AS CityName, states.name AS statename from users JOIN addresses ON (shipping_id=addresses.id)
       JOIN cities ON (city_id=cities.id) JOIN states ON (state_id=states.id) 
        ORDER BY users.id ASC"]
    @user = User.find(params[:shipping_id])
    @address = Address.find(params[:addres])
    @street_address = print @nice
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
    @user = User.find(params[:id])
    redirect_to portals_path
    @user.destroy
  end
end
