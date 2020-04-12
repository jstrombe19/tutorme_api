class SubjectsController < ApplicationController
  before_action :find_subject_by_id, only: [:show, :update, :destroy]

  def index
    @subjects = Subject.all 

    render json: @subjects 
  end

  def show 
    if @subject 
      render json: @subject 
    else
      render status: 418
    end
  end

  def create 
    @subject = Subject.new(subject_params)
    if @subject.save
      render json: @subject 
    else
      render status: 422
    end
  end

  def update 
    if @subject 
      if @subject.update(subject_params)
        render json: @subject 
      else
        render status: 422
      end
    else
      render status: 401
    end
  end

  def destroy 
    if @subject 
      if @subject.destroy 
        redirect_to "http://localhost:3000/subjects"
      else
        render status: 422
      end
    else
      render status: 401
    end
  end

  private

  def subject_params 
    params.require(:subject).permit([:category, :title, :description])
  end

  def find_subject_by_id
    @subject = Subject.find(params[:id])
  end
  
end
