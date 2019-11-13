class DetalleOrdenPresupuestosController < ApplicationController
  before_action :set_detalle_orden_presupuesto, only: [:show, :edit, :update, :destroy]
  before_action :set_presupuesto

  # GET /detalle_orden_presupuestos
  # GET /detalle_orden_presupuestos.json
  def index
    @detalle_orden_presupuestos = DetalleOrdenPresupuesto.all
  end

  # GET /detalle_orden_presupuestos/1
  # GET /detalle_orden_presupuestos/1.json
  def show
  end

  # GET /detalle_orden_presupuestos/new
  def new
    @detalle_orden_presupuesto = @presupuesto.detalle_orden_presupuestos.build
    @detalle_orden_presupuesto.repuesto_servicio = RepuestoServicio.first
    # @detalle_orden_presupuesto = DetalleOrdenPresupuesto.new
    # @detalle_orden_presupuesto.presupuesto_id=params[:presupuesto]
  end

  # GET /detalle_orden_presupuestos/1/edit
  def edit
    @detalle_orden_presupuesto = DetalleOrdenPresupuesto.find(params[:id])
  end

  # POST /detalle_orden_presupuestos
  # POST /detalle_orden_presupuestos.json
  def create
    @detalle_orden_presupuesto = DetalleOrdenPresupuesto.new(detalle_orden_presupuesto_params)
    @detalle_orden_presupuesto.presupuesto = @presupuesto

        item_exists = false
    		repuesto_servicio_id = params[:detalle_orden_presupuesto][:repuesto_servicio_id].to_i
    		@presupuesto.detalle_orden_presupuestos.each do |detail|
    			if detail.repuesto_servicio_id == repuesto_servicio_id
    				# Ya existe el item en la factura, agregar cantidad
    				item_exists = true
    				@detalle_orden_presupuesto = detail
    				@saved_detalle_orden_presupuesto = detail.id
    				break
    			end
    		end
    		if item_exists
    			@detalle_orden_presupuesto.cantidad += params[:detalle_orden_presupuesto][:cantidad].to_i
    			@detalle_orden_presupuesto.precio_unitario = params[:detalle_orden_presupuesto][:precio_unitario].to_f
    			@detalle_orden_presupuesto.save!
    		else
    			detalle_orden_presupuesto = DetalleOrdenPresupuesto.new(detalle_orden_presupuesto_params)
    			@presupuesto.detalle_orden_presupuestos << detalle_orden_presupuesto
    		end


        respond_to do |format|
          if @presupuesto.save!
            format.html { redirect_to @detalle_orden_presupuesto.presupuesto}
            format.json { render :show, status: :ok, location: @detalle_orden_presupuesto }
          else
            format.html { render :edit }
            format.json { render json: @detalle_orden_presupuesto.errors, status: :unprocessable_entity }
          end
        end
  end

  # PATCH/PUT /detalle_orden_presupuestos/1
  # PATCH/PUT /detalle_orden_presupuestos/1.json
  def update
    respond_to do |format|
      if @detalle_orden_presupuesto.update(detalle_orden_presupuesto_params)
        format.html { redirect_to @detalle_orden_presupuesto.presupuesto, notice: 'Detalle orden presupuesto was successfully updated.' }
        format.json { render :show, status: :ok, location: @detalle_orden_presupuesto }
      else
        format.html { render :edit }
        format.json { render json: @detalle_orden_presupuesto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /detalle_orden_presupuestos/1
  # DELETE /detalle_orden_presupuestos/1.json
  def destroy
    @detalle_orden_presupuesto = DetalleOrdenPresupuesto.find(params[:id])
		@detalle_orden_presupuesto.destroy

		respond_to do |format|
			format.js { render layout: false }
      format.html { redirect_to @presupuesto, notice: 'Detalle Eliminado.' }
		end
  end

  private

    def set_presupuesto
      @presupuesto = Presupuesto.find(params[:presupuesto_id].to_i)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_detalle_orden_presupuesto
      @detalle_orden_presupuesto = DetalleOrdenPresupuesto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def detalle_orden_presupuesto_params
      params.require(:detalle_orden_presupuesto).permit(:presupuesto_id, :repuesto_servicio_id, :cantidad, :precio_unitario, :subtotal, :total, :_destroy)
    end
end
