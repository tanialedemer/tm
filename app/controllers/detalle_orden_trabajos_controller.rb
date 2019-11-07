class DetalleOrdenTrabajosController < ApplicationController
  before_action :set_detalle_orden_trabajo, only: [:show, :edit, :update, :destroy]
  before_action :set_orden_trabajo


  # GET /detalle_orden_trabajos
  # GET /detalle_orden_trabajos.json
  def index
    @detalle_orden_trabajos = DetalleOrdenTrabajo.all
  end

  # GET /detalle_orden_trabajos/1
  # GET /detalle_orden_trabajos/1.json
  def show
  end

  # GET /detalle_orden_trabajos/new
  def new
    @detalle_orden_trabajo = DetalleOrdenTrabajo.new
    @detalle_orden_trabajo.orden_trabajo_id=params[:orden_trabajo]

  end

  # GET /detalle_orden_trabajos/1/edit
  def edit
  end

  # POST /detalle_orden_trabajos
  # POST /detalle_orden_trabajos.json
  def create
    @detalle_orden_trabajo = DetalleOrdenTrabajo.new(detalle_orden_trabajo_params)
    @detalle_orden_trabajo.orden_trabajo = @orden_trabajo

    respond_to do |format|
      if @detalle_orden_trabajo.save
        format.html { redirect_to @detalle_orden_trabajo.orden_trabajo, notice: 'Detalle orden trabajo was successfully created.' }
        format.json { render :show, status: :created, location: @detalle_orden_trabajo }
      else
        format.html { render :new }
        format.json { render json: @detalle_orden_trabajo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /detalle_orden_trabajos/1
  # PATCH/PUT /detalle_orden_trabajos/1.json
  def update
    respond_to do |format|
      if @detalle_orden_trabajo.update(detalle_orden_trabajo_params)
        format.html { redirect_to @detalle_orden_trabajo.orden_trabajo, notice: 'Detalle orden trabajo was successfully updated.' }
        format.json { render :show, status: :ok, location: @detalle_orden_trabajo }
      else
        format.html { render :edit }
        format.json { render json: @detalle_orden_trabajo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /detalle_orden_trabajos/1
  # DELETE /detalle_orden_trabajos/1.json
  def destroy
    @detalle_orden_trabajo.destroy
    respond_to do |format|
      format.html { redirect_to @orden_trabajo, notice: 'Detalle orden trabajo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_orden_trabajo
      @orden_trabajo = OrdenTrabajo.find(params[:orden_trabajo_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_detalle_orden_trabajo
      @detalle_orden_trabajo = DetalleOrdenTrabajo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def detalle_orden_trabajo_params
      params.require(:detalle_orden_trabajo).permit(:orden_trabajo_id, :repuesto_servicio_id, :cantidad, :precio_venta, :subtotal, :total)
    end
end
