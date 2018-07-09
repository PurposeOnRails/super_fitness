class StepDayLogsController < ApplicationController
  before_action :set_step_day_log, only: [:show, :edit, :update, :destroy]

  # GET /step_day_logs
  # GET /step_day_logs.json
  def index
    @step_day_logs = StepDayLog.where(user_id: current_user&.id)
  end

  # GET /step_day_logs/1
  # GET /step_day_logs/1.json
  def show
  end

  # GET /step_day_logs/new
  def new
    @step_day_log = StepDayLog.new
  end

  # GET /step_day_logs/1/edit
  def edit
  end

  # POST /step_day_logs
  # POST /step_day_logs.json
  def create
    @step_day_log = StepDayLog.new(step_day_log_params)
    @step_day_log.user_id = current_user&.id

    respond_to do |format|
      if @step_day_log.save
        format.html { redirect_to @step_day_log, notice: 'Step day log was successfully created.' }
        format.json { render :show, status: :created, location: @step_day_log }
      else
        format.html { render :new }
        format.json { render json: @step_day_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /step_day_logs/1
  # PATCH/PUT /step_day_logs/1.json
  def update
    respond_to do |format|
      if @step_day_log.update(step_day_log_params)
        format.html { redirect_to @step_day_log, notice: 'Step day log was successfully updated.' }
        format.json { render :show, status: :ok, location: @step_day_log }
      else
        format.html { render :edit }
        format.json { render json: @step_day_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /step_day_logs/1
  # DELETE /step_day_logs/1.json
  def destroy
    @step_day_log.destroy
    respond_to do |format|
      format.html { redirect_to step_day_logs_url, notice: 'Step day log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_step_day_log
      @step_day_log = StepDayLog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def step_day_log_params
      params.require(:step_day_log).permit(:step_count, :date)
    end
end
