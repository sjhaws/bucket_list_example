class DestinationsController < ApplicationController
  before_action :set_list
  before_action :set_destination, only: [:edit, :update, :show, :destroy]

  def show
  end

  def create
    @destination = @list.build_destination(dest_params)

    if @destination.save
      redirect_to [@list, @destination]
    else
      render :new
    end
  end

  def new
    @destination = Destination.new
    render partial: 'form'
  end

  def edit
    render partial: 'form'
  end

  def update
    if @destination.update(dest_params)
      redirect_to [@list, @destination]
    else
      render :edit
    end
  end

  def destroy
    @destination.destroy
    redirect_to list_path(@list)
  end

  private
    def set_list
      @list = List.find(params[:list_id])
    end

    def set_destination
      @destination = Destination.find(params[:id])
    end

    def dest_params
      params.require(:destination).permit(:country, :city, :img_url)
    end
end
