class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer_add = Customer.new(customer_params)
    if(@customer_add.save)
      redirect_to @customer_add
    else
      render 'new'
    end
  end

  def show
    @customer = Customer.includes(:reservations).find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if(@customer.update(customer_params))
      redirect_to @customer
    else
      render 'edit'
    end

  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to customers_path
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :surname, :email, :phone)
  end
end
