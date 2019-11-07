class PaymentDetailsController < ApplicationController
  before_action :set_payment, only: [:new, :create, :destroy]
  #before_action :set_payment, only: [:new, :create, :destroy]


  # GET /payment_details
  # GET /payment_details.json
  def index
    # @payment_details = PaymentDetail.all
  end

  # GET /payment_details/1
  # GET /payment_details/1.json
  def show
  end

  # GET /payment_details/new
  def new
    # @payment_detail = PaymentDetail.new
    @payment_details = @payment.payment_details.build
    # @payment_details.payment_id=params[:payment]
		@payment_details.repuesto_servicio = RepuestoServicio.first
  end

  # GET /payment_details/1/edit
  def edit
    		@payment_detail = PaymentDetail.find(params[:id])
  end

  # POST /payment_details
  # POST /payment_details.json
  def create
    # @payment_detail = PaymentDetail.new(payment_detail_params)
    # @payment_detail.payment = @payment
    #
    # respond_to do |format|
    #   if @payment_detail.save
    #     format.html { redirect_to @payment_detail.payment, notice: 'Payment detail was successfully created.' }
    #     format.json { render :show, status: :created, location: @payment_detail }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @payment_detail.errors, status: :unprocessable_entity }
    #   end
    # end

    item_exists = false
		repuesto_servicio_id = params[:payment_details][:repuesto_servicio_id].to_i
		@payment.payment_details.each do |detail|
			if detail.repuesto_servicio_id == repuesto_servicio_id
				# Ya existe el item en la factura, agregar cantidad
				item_exists = true
				@payment_detail = detail
				@saved_payment_detail = detail.id
				break
			end
		end
		if item_exists
			@payment_detail.cantidad += params[:payment_details][:cantidad].to_i
			@payment_detail.precio_unitario = params[:payment_details][:precio_unitario].to_f
			@payment_detail.save!
		else
			payment_detail = PaymentDetail.new(payment_detail_params)
      # payment_detail.payment = @payment
			if @payment.payment_details.last.nil?
				payment_detail.num_fact = 1
			else
				payment_detail.num_fact = @payment.payment_details.last.num_fact + 1
			end
			@payment.payment_details << payment_detail
		end
		@payment.save!
  end

  # PATCH/PUT /payment_details/1
  # PATCH/PUT /payment_details/1.json
  def update
    # respond_to do |format|
    #   if @payment_detail.update(payment_detail_params)
    #     format.html { redirect_to @payment_detail.payment, notice: 'Payment detail was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @payment_detail }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @payment_detail.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /payment_details/1
  # DELETE /payment_details/1.json
  def destroy
    # @payment_detail.destroy
    # respond_to do |format|
    #   format.html { redirect_to @payment, notice: 'Payment detail was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
    @payment_detail = PaymentDetail.find(params[:id])
		@payment_detail.destroy

		respond_to do |format|
			format.js { render layout: false }
		end
  end

  private

    # def set_payment
    #     @payment = Payment.find(params[:payment_id])
    # end
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:payment_id].to_i)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_detail_params
      params.require(:payment_detail).permit(:id, :cantidad, :subtotal, :payment_id, :repuesto_servicio_id, :precio_unitario, :total, :saldo, :precio_venta, :pago, :_destroy)
    end
end
