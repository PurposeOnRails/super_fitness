class ApiController < ApplicationController
  def retrieve_user
    id = params[:id]
    render json: { user_id: id }.to_json
  end
end
