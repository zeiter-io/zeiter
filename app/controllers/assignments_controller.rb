class AssignmentsController < ApplicationController
  before_action :set_assignment, only: [:show, :edit, :update, :destroy]

  # GET /assignments
  def index
    @assignments = Assignment.all
  end

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

    @assignment.schedule_id = params[:schedule_id]

    if @assignment.save
      #redirect_to @assignment, notice: 'Assignment was successfully created.'
      redirect_to @assignment.schedule, notice: "#{@assignment.user.first_name} #{@assignment.user.last_name} added to #{@assignment.schedule.name}"
    else
      render :new
    end
  end

  # PATCH/PUT /assignments/1
  def update
    if @assignment.update(assignment_params)
      redirect_to @assignment, notice: 'Assignment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /assignments/1
  def destroy
    @assignment.destroy
    redirect_to assignments_url, notice: 'Assignment was successfully destroyed.'
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
