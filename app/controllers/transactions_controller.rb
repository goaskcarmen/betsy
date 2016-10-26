class TransactionsController < ApplicationController
  def new
    cart_items = CartProduct.where(cart_id: session[:cart_id])
    if cart_items.all.length != 0
      @transaction = Transaction.new
    else
      flash[:notice] = "You have no items to checkout!"
      redirect_to(:back)
    end
  end

  def create

      @transaction = Transaction.new
      @transaction.client_name = params[:transaction][:client_name]
      @transaction.client_email = params[:transaction][:client_email]
      @transaction.client_address = params[:transaction][:client_address]
      @transaction.client_cc_num = params[:transaction][:client_cc_num].slice(-4..-1)
      @transaction.client_cc_exp = params[:transaction][:client_cc_exp]
      @transaction.status = "paid"
      @transaction.total_price = nil
      @transaction.save

      @cart = CartProduct.where(cart_id: session[:cart_id])

      @cart.each do |i|
        q = i.product_quantity
        p = Product.find(i.product_id)
        m = User.find(p.user_id)
        @tp = TransactionProduct.new
        @tp.product_name = p.name
        @tp.product_unit_price = p.unit_price
        @tp.product_description = p.description
        @tp.product_quantity = q
        @tp.product_total_price = q*p.unit_price
        @tp.merchant_email = m.email
        @tp.mark_shipped = false
        @tp.merchant_name = m.name
        @tp.product_id = p.id
        @tp.order_id = @transaction.id
        @tp.merchant_id = m.id
        @tp.save
        p.quantity -= q
        p.save
        i.destroy
      end

  end

  def show
    @transaction = Transaction.find(params[:id])
    @mytransaction = TransactionProduct.where(order_id: @transaction.id)
  end

  def show_all
    @mytps = TransactionProduct.where(merchant_id: session[:user_id])
  end

  private
  def user_params
    params.require(:transaction).permit(:client_name, :client_email, :status, :client_address, :client_cc_num, :client_cc_exp)
  end

end
