class HeartRateLogsController < ApplicationController
  before_action :set_heart_rate_log, only: [:show, :edit, :update, :destroy]

  # GET /heart_rate_logs
  # GET /heart_rate_logs.json
  def index
    @heart_rate_logs = HeartRateLog.where(user_id: current_user&.id)
  end

  # GET /heart_rate_logs/1
  # GET /heart_rate_logs/1.json
  def show
  end

  # GET /heart_rate_logs/new
  def new
    @heart_rate_log = HeartRateLog.new
  end

  # GET /heart_rate_logs/1/edit
  def edit
  end

  # POST /heart_rate_logs
  # POST /heart_rate_logs.json
  def create
    @heart_rate_log = HeartRateLog.new(heart_rate_log_params)
    @heart_rate_log.user_id = current_user&.id

    respond_to do |format|
      if @heart_rate_log.save
        format.html { redirect_to @heart_rate_log, notice: 'Heart rate log was successfully created.' }
        format.json { render :show, status: :created, location: @heart_rate_log }
      else
        format.html { render :new }
        format.json { render json: @heart_rate_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /heart_rate_logs/1
  # PATCH/PUT /heart_rate_logs/1.json
  def update
    respond_to do |format|
      if @heart_rate_log.update(heart_rate_log_params)
        format.html { redirect_to @heart_rate_log, notice: 'Heart rate log was successfully updated.' }
        format.json { render :show, status: :ok, location: @heart_rate_log }
      else
        format.html { render :edit }
        format.json { render json: @heart_rate_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /heart_rate_logs/1
  # DELETE /heart_rate_logs/1.json
  def destroy
    @heart_rate_log.destroy
    respond_to do |format|
      format.html { redirect_to heart_rate_logs_url, notice: 'Heart rate log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_heart_rate_log
      @heart_rate_log = HeartRateLog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def heart_rate_log_params
      params.require(:heart_rate_log).permit(:heart_rate, :date)
    end
end
