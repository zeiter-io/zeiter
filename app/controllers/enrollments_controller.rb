class EnrollmentsController < ApplicationController
  before_action :set_enrollment, only: [:show, :edit, :update, :destroy]

  # GET /enrollments/1
  def show
  end

  # GET /enrollments/new
  def new
    @enrollment = Enrollment.new
  end

  # GET /enrollments/1/edit
  def edit
  end

  # POST /enrollments
  def create
    @enrollment = Enrollment.new(enrollment_params)
    # verify the schedule exists
    schedule_id = Schedule.find(params[:schedule_id])
    raise ArgumentError, "Schedule ID #{params[:schedule_id]} not found." unless schedule_id
    @enrollment.schedule_id = Schedule.find(params[:schedule_id]).id
    
    if @enrollment.save
      redirect_to @enrollment.schedule, notice: "#{@enrollment.user.full_name} added to #{@enrollment.schedule.name}"
    else
      @schedule = @enrollment.schedule
      @shifts = @schedule.shifts
      render "schedules/show"
    end
  end

  # DELETE /enrollments/1
  def destroy
    @enrollment.destroy
    redirect_to @enrollment.schedule, notice: "#{@enrollment.user.full_name} removed from #{@enrollment.schedule.name}"    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enrollment
      @enrollment = Enrollment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def enrollment_params
      #params.fetch(:enrollment, {})
      params.require(:enrollment).permit(:user_id, :schedule_id)
    end
end
