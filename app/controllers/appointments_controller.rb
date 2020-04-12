class AppointmentsController < ApplicationController
  before_action :find_appointment_by_id, only: [:show, :update, :destroy]

  def index
    @appointments = Appointment.all 

    render json: @appointments
  end

  def show 
    if @appointment 
      render json: @appointment, :include => {
        :subject => {},
        :tutor => {
          :only => [:name, :email, :experience]
        },
        :student => {
          :only => [:name, :email]
        }
      }
    else
      render status: 404
    end
  end
  
  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      render json: @appointment 
    else
      render @appointment.errors.messages
    end
  end

  def update 
    if @appointment 
      if @appointment.update(appointment_params)
        render json: @appointment
      else
        render status: 422
      end
    else
      render status: 404
    end
  end

  def destroy 
    if @appointment 
      if @appointment.destroy 
        redirect_to "https://tutorme-api-beta.herokuapp.com/appointments"
      else
        render @appointment.errors.messages 
      end
    else
      render status: 404
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit([
      :appointment_date, 
      :appointment_time, 
      :appointment_duration, 
      :communication_medium, 
      :rating, 
      :comments, 
      :student_id, 
      :tutor_id, 
      :subject_id
    ])
  end
    
  def find_appointment_by_id
    @appointment = Appointment.find(params[:id])
  end

end
