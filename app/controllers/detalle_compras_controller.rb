class DetalleComprasController < ApplicationController
  before_action :set_detalle_compra, only: [:show, :edit, :update, :_destroy]
  before_action :set_compra


  # GET /detalle_compras
  # GET /detalle_compras.json
  def index
    @detalle_compras = DetalleCompra.all
  end

  # GET /detalle_compras/1
  # GET /detalle_compras/1.json
  def show
  end

  # GET /detalle_compras/new
  def new
    # @detalle_compra = DetalleCompra.new
    # @detalle_compra.compra_id=params[:compra]
    @detalle_compra = @compra.detalle_compras.build
    @detalle_compra.repuesto_servicio = RepuestoServicio.first
  end

  # GET /detalle_compras/1/edit
  def edit
    		@detalle_compra = DetalleCompra.find(params[:id])
  end

  # POST /detalle_compras
  # POST /detalle_compras.json
  def create

    item_exists = false
		repuesto_servicio_id = params[:detalle_compra][:repuesto_servicio_id].to_i
		@compra.detalle_compras.each do |detail|
			if detail.repuesto_servicio_id == repuesto_servicio_id
				# Ya existe el item en la factura, agregar cantidad
				item_exists = true
				@detalle_compra = detail
				@saved_detalle_compra = detail.id
				break
			end
		end
		if item_exists
			@detalle_compra.cantidad += params[:detalle_compra][:cantidad].to_i
			@detalle_compra.precio_unitario = params[:detalle_compra][:precio_unitario].to_f
			@detalle_compra.save!
		else
			detalle_compra = DetalleCompra.new(detalle_compra_params)
			@compra.detalle_compras << detalle_compra
		end


    respond_to do |format|
      if @compra.save!
        format.html { redirect_to @detalle_compra.compra}
        format.json { render :show, status: :ok, location: @detalle_compra.compra }
      else
        format.html { render :edit }
        format.json { render json: @detalle_compra.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /detalle_compras/1
  # PATCH/PUT /detalle_compras/1.json
  def update
    respond_to do |format|
      if @detalle_compra.update(detalle_compra_params)
        format.html { redirect_to @detalle_compra.compra}
        format.json { render :show, status: :ok, location: @detalle_compra }
      else
        format.html { render :edit }
        format.json { render json: @detalle_compra.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /detalle_compras/1
  # DELETE /detalle_compras/1.json
  def destroy
    @detalle_compra = DetalleCompra.find(params[:id])
		@detalle_compra.destroy

		respond_to do |format|
			format.js { render layout: false }
      format.html { redirect_to @compra, notice: 'Detalle compra was successfully destroyed.' }
		end
    # @detalle_compra.destroy
    # respond_to do |format|
    #   format.html { redirect_to @compra, notice: 'Detalle compra was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  private

    def set_compra
      @compra = Compra.find(params[:compra_id].to_i)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_detalle_compra
      @detalle_compra = DetalleCompra.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def detalle_compra_params
      params.require(:detalle_compra).permit(:compra_id, :repuesto_servicio_id, :cantidad, :subtotal, :iva, :precio_unitario, :precio_venta, :total, :pago, :saldo, :_destroy)
    end
end
