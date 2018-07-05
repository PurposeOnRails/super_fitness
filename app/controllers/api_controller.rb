class ApiController < ApplicationController
  def retrieve_user
    user = User.find(id) #.for(purpose)
    render json: user.as_json
  end

  def retrieve_all_users
    users = User.all #.for(purpose)
    render json: users.map(&:as_json)
  end

  def id
    @id ||= params[:id]
  end

  def purpose
    @purpose ||= params[:purpose]
  end
end
