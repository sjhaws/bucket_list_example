class NotesController < ApplicationController
  before_action :set_activity
  before_action :set_note, only: [:edit, :update, :destroy]

  def new
    @note = Note.new
    render partial: 'form'
  end

  def edit
    render partial: 'form'
  end

  def create
    @note = @activity.notes.new(note_params)
    if @note.save
      redirect_to list_activity_path(@activity.list_id, @activity)
    else
      render :new
    end
  end

  def update
    if @note.update(note_params)
      redirect_to list_activity_path(@activity.list_id, @activity)
    else
      render :edit
    end
  end

  def destroy
    @note.destroy
      redirect_to list_activity_path(@activity.list_id, @activity)
  end

  private
    def set_activity
      @activity = Activity.find(params[:activity_id])
    end

    def set_note
      @note = Note.find(params[:id])
    end

    def note_params
      params.require(:note).permit(:body)
    end
end
