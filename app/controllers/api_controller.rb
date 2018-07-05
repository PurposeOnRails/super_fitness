class ApiController < ApplicationController
  def retrieve_user
    render json: { user_id: id, purpose: purpose }.to_json
  end

  def retrieve_all_users
    render json: { purpose: purpose }.to_json
  end

  def id
    @id ||= params[:id]
  end

  def purpose
    @purpose ||= params[:purpose]
  end
end
