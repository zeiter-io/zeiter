class AssignmentsController < ApplicationController
  before_action :set_assignment, only: [:show, :edit, :update, :destroy]

  # GET /assignments/1
  def show
  end

  # GET /assignments/new
  def new
    @assignment = Assignment.new
  end

  # GET /assignments/1/edit
  def edit
  end

  # POST /assignments
  def create
    @assignment = Assignment.new(assignment_params)
    # verify the schedule exists
    schedule_id = Schedule.find(params[:schedule_id])
    raise ArgumentError, "Schedule ID #{params[:schedule_id]} not found." unless schedule_id
    @assignment.schedule_id = Schedule.find(params[:schedule_id]).id
    
    if @assignment.save
      redirect_to @assignment.schedule, notice: "#{@assignment.user.full_name} added to #{@assignment.schedule.name}"
    else
      @schedule = @assignment.schedule
      @shifts = @schedule.shifts
      render "schedules/show"
    end
  end

  # DELETE /assignments/1
  def destroy
    @assignment.destroy
    redirect_to @assignment.schedule, notice: "#{@assignment.user.full_name} removed from #{@assignment.schedule.name}"    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assignment
      @assignment = Assignment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def assignment_params
      #params.fetch(:assignment, {})
      params.require(:assignment).permit(:user_id, :schedule_id)
    end
end
