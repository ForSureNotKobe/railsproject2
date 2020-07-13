class ClientsController < ApplicationController

  def new
    @client = Client.new
  end

  def create
    @client = Company.find(params[:company_id]).clients.new(client_params)
    if @client.save
      flash[:success] = "Client has been created!"
      redirect_to company_path(current_user.company)
    else
      render 'new'
    end
  end

  def show

  end

  def edit

  end

  def update

  end

  def index

  end

  private


  def client_params
    params.require(:client).permit(:name, :vatcode, :address, :city, :company_id)
  end
end
