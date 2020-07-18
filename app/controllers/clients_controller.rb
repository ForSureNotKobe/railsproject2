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
    @client = Company.find(params[:company_id]).clients.find(params[:id])
  end

  def edit
    @client = Company.find(params[:company_id]).clients.find(params[:id])
  end

  def update
    @client = Company.find(params[:company_id]).clients.find(params[:id])
    if @client.update(client_params)
      flash[:success] = "Client data updated!"
      redirect_to company_clients_path(@company)
    else
      render 'edit'
    end
  end

  def index
    @clients = current_user.company.clients
  end

  def destroy
    Company.find(params[:company_id]).clients.find(params[:id]).destroy
    flash[:success] = "Client deleted!"
    redirect_to company_clients_path(@company)
  end

  private


  def client_params
    params.require(:client).permit(:name, :vatcode, :address, :city, :company_id)
  end
end
