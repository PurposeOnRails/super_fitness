class PurposesController < ApplicationController
  def index
    @purposes = Purpose.all
  end

  def show
    @purpose = Purpose.find(params[:id])
  end
end
