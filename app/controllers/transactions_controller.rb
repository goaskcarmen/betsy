class TransactionsController < ApplicationController
  def new
    @transaction = Transaction.new
  end

  def create
    @mytransaction = Transaction.new
    @mytransaction.client_name = params[:client_name]
    @mytransaction.client_email = params[:client_email]
    @mytransaction.client_address = params[:client_address]
    @mytransaction.client_cc_num = params[:client_cc_num]
    @mytransaction.client_cc_exp = params[:client_cc_exp]
    @mytransaction.status = nil
    @mytransaction.total_price = nil
    # @mytransaction.save

  end

  def show
  end

  def show_all
  end

  private
  def user_params
    params.require(:transaction).permit(:client_name, :client_email, :status, :)
  end

end
