class PaymentsController < ApplicationController
  # before_action :set_payment, only: [:create,:new, :show, :edit, :update, :destroy]
   PAGE_SIZE = 10
  # GET /payments
  # GET /payments.json
  def index
    @payments = Payment.all
    unsaved_payments = Payment.where(estado: "draft")
    unsaved_payments.each do |payment|
      payment.destroy
    end

    # @page = (params[:page] || 0).to_i
    # @keywords = params[:keywords]
    #
    # search = Search.new(@page, PAGE_SIZE, @keywords)
    # @payments, @number_of_pages = search.payments
  end

  # GET /payments/1
  # GET /payments/1.json
  def show
  end

  # GET /payments/new
  def new
    # @payment = Payment.find(params[:payment_id])
    # @payment.payment_details.build (params[:payment_details])
    # @payment = Payment.new
    # @payment_detail = PaymentDetail.new
    last_payment = Payment.where(estado: "confirmed").maximum('num_fact')
    number =  (last_payment != nil) ? last_payment + 1 : 1
    # @payment = Payment.create(fecha: Date::current, num_fact: number, estado: "draft", payment_id: payment.id)
    # @payment.payment_details.build
    # params[:payment_id] = @payment.id.to_s
    @payment.payment_id=params[:payment_detail]
    if params[:payment_detail]!=nil
      payment_id=params[:payment_detail]
      @payment_detail=PaymentDetail.find(payment_id)
      @payment_id=@payment.payment_id
    end
  end

  # GET /payments/1/edit
  def edit
  end

  # POST /payments
  # POST /payments.json
  def create
    # @payment = Payment.new(payment_params)
    #
    # respond_to do |format|
    #   if @payment.save
    #     format.html { redirect_to @payment, notice: 'Payment was successfully created.' }
    #     format.json { render :show, status: :created, location: @payment }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @payment.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /payments/1
  # PATCH/PUT /payments/1.json
  def update
     @payment.confirmed!
    respond_to do |format|
      if @payment.update(payment_params)
        format.html { redirect_to @payment, notice: 'Payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @payment }
      else
        format.html { render :edit }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1
  # DELETE /payments/1.json
  def destroy
    @payment.destroy
    respond_to do |format|
      format.html { redirect_to payments_url, notice: 'Payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_payment
    #   @payment = Payment.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_params
      params.require(:payment).permit(:fecha, :proveedor_id, :tipo_factura_id, :num_fact, :estado,
         payment_detail_attributes: [:id, :cantidad, :subtotal, :payment_id, :repuesto_servicio_id, :precio_unitario, :total, :saldo, :precio_venta, :pago , :_destroy])
    end
end
