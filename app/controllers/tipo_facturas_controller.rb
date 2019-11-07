class TipoFacturasController < ApplicationController
  before_action :set_tipo_factura, only: [:show, :edit, :update, :destroy]

  # GET /tipo_facturas
  # GET /tipo_facturas.json
  def index
    @tipo_facturas = TipoFactura.all
  end

  # GET /tipo_facturas/1
  # GET /tipo_facturas/1.json
  def show
  end

  # GET /tipo_facturas/new
  def new
    @tipo_factura = TipoFactura.new
  end

  # GET /tipo_facturas/1/edit
  def edit
  end

  # POST /tipo_facturas
  # POST /tipo_facturas.json
  def create
    @tipo_factura = TipoFactura.new(tipo_factura_params)

    respond_to do |format|
      if @tipo_factura.save
        format.html { redirect_to @tipo_factura, notice: 'Tipo factura was successfully created.' }
        format.json { render :show, status: :created, location: @tipo_factura }
      else
        format.html { render :new }
        format.json { render json: @tipo_factura.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_facturas/1
  # PATCH/PUT /tipo_facturas/1.json
  def update
    respond_to do |format|
      if @tipo_factura.update(tipo_factura_params)
        format.html { redirect_to @tipo_factura, notice: 'Tipo factura was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipo_factura }
      else
        format.html { render :edit }
        format.json { render json: @tipo_factura.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_facturas/1
  # DELETE /tipo_facturas/1.json
  def destroy
    @tipo_factura.destroy
    respond_to do |format|
      format.html { redirect_to tipo_facturas_url, notice: 'Tipo factura was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_factura
      @tipo_factura = TipoFactura.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_factura_params
      params.require(:tipo_factura).permit(:descripcion)
    end
end
