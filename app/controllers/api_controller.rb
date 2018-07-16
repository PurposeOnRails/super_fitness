class ApiController < ApplicationController

  def retrieve_user
    user = User.find(id)
    render json: user.as_json(include_steps: false, include_heart_rate: false)
  end

  def retrieve_all_users
    users = User.all
    render json: users.map(&:as_json)
  end

  def get_steps
    steps = User.find(id).heart_rate_logs
    render json: steps.map(&:as_json)
  end

  def get_heart_rate_logs
    logs = User.find(id).heart_rate_logs
    render json: logs.map(&:as_json)
  end

  private

  def id
    @id ||= params[:id]
  end

  def purpose
    @purpose ||= AccessCode.find_by(code: params[:code]).purpose_id
  end
end
