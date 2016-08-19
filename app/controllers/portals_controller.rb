class PortalsController < ApplicationController
  def index
    @users = User.find_by_sql ["SELECT DISTINCT users.id AS id, first_name, last_name, 
      cities.name AS city_id, states.name AS statename, users.email from users 
      JOIN addresses ON (users.id=addresses.user_id)
      JOIN cities ON (addresses.city_id=cities.id)
      JOIN states ON (addresses.state_id=states.id)
      JOIN orders ON (users.id = orders.user_id)
      ORDER BY users.id ASC LIMIT 10"]
  end

  def show
    @user = User.find(params[:id])
    @nice = User.find_by_sql ["SELECT DISTINCT users.id AS id, first_name, last_name, 
      cities.name AS city_id, states.name AS statename, users.email from users 
      JOIN addresses ON (users.id=addresses.user_id)
      JOIN cities ON (addresses.city_id=cities.id)
      JOIN states ON (addresses.state_id=states.id)
      JOIN orders ON (users.id = orders.user_id)
      ORDER BY users.id ASC LIMIT 10"]
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