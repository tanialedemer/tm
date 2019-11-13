class ComprasController < ApplicationController
  before_action :set_compra, except: [:index, :new, :create]

  # GET /compras
  # GET /compras.json
  def index
    @compras = Compra.all
  end

  # GET /compras/1
  # GET /compras/1.json
  def show
    @detalle_compra = DetalleCompra.new
  end

  # GET /compras/new
  def new
    last_compra = Compra.where(estado: "confirmed").maximum('num_fact')
    number =  (last_compra != nil) ? last_compra + 1 : 1
    @compra = Compra.create(fecha: Date::current, num_fact: number, estado: "draft")
    @compra.detalle_compras.build
    params[:compra_id] = @compra.id.to_s
  end

  # GET /compras/1/edit
  def edit
  end

  # POST /compras
  # POST /compras.json
  def create
    @compra = Compra.new(compra_params)

    respond_to do |format|
      if @compra.save
        format.html { redirect_to @compra, notice: 'Compra was successfully created.' }
        format.json { render :show, status: :created, location: @compra }
      else
        format.html { render :new }
        format.json { render json: @compra.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /compras/1
  # PATCH/PUT /compras/1.json
  def update
    respond_to do |format|
      if @compra.update(compra_params)
        format.html { redirect_to @compra, notice: 'Compra was successfully updated.' }
        format.json { render :show, status: :ok, location: @compra }
      else
        format.html { render :edit }
        format.json { render json: @compra.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /compras/1
  # DELETE /compras/1.json
  def destroy
    @compra.destroy
    respond_to do |format|
      format.html { redirect_to compras_url, notice: 'Compra was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_compra
      @compra = Compra.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def compra_params
      params.require(:compra).permit(:fecha, :proveedor_id, :tipo_factura_id, :num_fact, :estado,
      :detalle_compras_attributes => [:id,:compra_id, :repuesto_servicio_id, :cantidad, :subtotal, :iva, :precio_unitario, :precio_venta, :total, :pago, :saldo, :_destroy])
    end
end
