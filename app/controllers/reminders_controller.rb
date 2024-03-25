class RemindersController < ApplicationController
  before_action :set_reminder, only: [:show, :edit, :update, :destroy]
  before_action :set_my_guide, only: [:show, :new, :create, :edit, :update, :destroy]
  before_action :set_user, only: [:show, :new, :create, :edit, :update, :destroy]

  def show
  end

  def index
    # Scope your query to the dates being shown:
    start_date = params.fetch(:start_date, Date.today).to_date

    # For a monthly view:
    @reminders = Reminder.where(starts_at: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)

    # Or, for a weekly view:
      @reminders = Reminder.where(starts_at: start_date.beginning_of_week..start_date.end_of_week)
  end

  def new
    @reminder = Reminder.new
  end

  # POST /reminders
  def create
    @reminder = Reminder.new(reminder_params)
    @reminder.user = current_user
    @reminder.my_guide = @my_guide

    respond_to do |format|
      if @reminder.save
        format.html { redirect_to user_path(@user), notice: 'Reminder was successfully created.' }
        # format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        # format.json { render json: @reminder.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET reminders/1/edit
  def edit
  end

  # PATCH/PUT /reminders/1
  def update
    respond_to do |format|
      if @reminder.update(reminder_params)
        format.html { redirect_to user_path(@user), notice: "Reminder was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @reminder.destroy
    redirect_to user_path(@user)
  end

  private
  def set_reminder
    @reminder = Reminder.find(params[:id])
  end

  def set_user
    @user = current_user
  end

  def set_my_guide
    @my_guide = MyGuide.find(params[:my_guide_id])
  end

  def reminder_params
    params.require(:reminder).permit(
      :title,
      :description,
      :url,
      :status,
      :start_time,
      :end_time,
      :user_id,
      :my_guide_id
    )
  end

end
