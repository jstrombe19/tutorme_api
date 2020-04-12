class TutorSubjectsController < ApplicationController
  before_action :find_tutor_subject_by_id, only: [:show, :update, :destroy]

  def index
    @tutor_subjects = TutorSubject.all 

    render json: @tutor_subjects 
  end

  def show
    if @user
      render json: @user 
    else
      render status: 418
    end
  end

  def create
    @tutor_subject = TutorSubject.new(tutor_subject_params)
    if @tutor_subject.save
      render json: @tutor_subject
    else
      render @tutor_subject.errors.messages
    end
  end

  def update 
    if @tutor_subject
      if @tutor_subject.update(tutor_subject_params)
        render json: @tutor_subject
      else
        render status: 422
      end
    else
      render status: 401
    end
  end

  def destroy 
    if @tutor_subject 
      if @tutor_subject.destroy 
        redirect_to "https://tutorme-api-beta.herokuapp.com/tutor_subjects"
      else
        render @tutor_subject.errors.messages 
      end
    else
      render status: 401
    end
  end

  private

  def tutor_subject_params
    params.require(:tutor_subject).permit([:tutor_id, :subject_id])
  end

  def find_tutor_subject_by_id
    @tutor_subject = TutorSubject.find(params[:id])
  end
  
end
