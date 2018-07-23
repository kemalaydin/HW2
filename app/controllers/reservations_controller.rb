class ReservationsController < ApplicationController
  def index
    @reservation = Reservation.includes(:customers).all
  end

  def new
    @customer = Customer.find(params[:customer_id])
  end

  def create
    @customer = Customer.find(params[:customer_id])
    @reservation = @customer.reservations.create!(reservation_params)
    redirect_to customer_path(@customer)
  end

  def edit
    @customer = Customer.find(params[:customer_id])
    @reservation = @customer.reservations.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:customer_id])
    @reservation = @customer.reservations.find(params[:id])

    if(@reservation.update(reservation_params))
      redirect_to customers_path(@customer)
    else
      render 'edit'
    end
  end

  def destroy
    @customer = Customer.find(params[:customer_id])
    @reservation = @customer.reservations.find(params[:id]).destroy
    redirect_to customer_path(@customer)
  end

  private
  def reservation_params
    params.require(:reservation).permit(:date,:reservation_code)
  end
end
