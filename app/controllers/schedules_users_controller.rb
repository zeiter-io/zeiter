class SchedulesUsersController < ApplicationController
  before_action :set_schedules_user, only: [:show, :edit, :update, :destroy]

  # GET /schedules_users
  def index
    @schedules_users = SchedulesUser.all
  end

  # GET /schedules_users/1
  def show
  end

  # GET /schedules_users/new
  def new
    @schedules_user = SchedulesUser.new
  end

  # GET /schedules_users/1/edit
  def edit
  end

  # POST /schedules_users
  def create
    @schedules_user = SchedulesUser.new(schedules_user_params)

    if @schedules_user.save
      redirect_to @schedules_user, notice: 'Schedules user was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /schedules_users/1
  def update
    if @schedules_user.update(schedules_user_params)
      redirect_to @schedules_user, notice: 'Schedules user was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /schedules_users/1
  def destroy
    @schedules_user.destroy
    redirect_to schedules_users_url, notice: 'Schedules user was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedules_user
      @schedules_user = SchedulesUser.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def schedules_user_params
      params.fetch(:schedules_user, {})
    end
end
