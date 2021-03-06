class RepuestoServiciosController < ApplicationController
  before_action :set_repuesto_servicio, only: [:show, :edit, :update, :destroy]
  PAGE_SIZE = 5

  # GET /repuesto_servicios
  # GET /repuesto_servicios.json
  def index
    @repuesto_servicios = RepuestoServicio.all
    respond_to do |format|
      format.html
      format.pdf do
        pdf = RepuestoServiciosPdf.new(@repuesto_servicios)
        send_data pdf.render, filename: 'repuesto_servicios.pdf', type: 'application/pdf', disposition: 'inline'
      end
    end
    
    @page = (params[:page] || 0).to_i

   if params[:keywords].present?
     @keywords = params[:keywords]
     @repuesto_servicios = RepuestoServicio.where("lower(descripcion) LIKE '%#{@keywords.downcase}%'").order(:descripcion)
                    .offset(PAGE_SIZE * @page).limit(PAGE_SIZE)
     number_of_records = RepuestoServicio.where("lower(descripcion) LIKE '%#{@keywords.downcase}%'").count
   else
     @repuesto_servicios = RepuestoServicio.order(:descripcion).offset(PAGE_SIZE * @page).limit(PAGE_SIZE)
     number_of_records = RepuestoServicio.count
   end
   @number_of_pages = (number_of_records % PAGE_SIZE) == 0 ?
                       number_of_records / PAGE_SIZE - 1 : number_of_records / PAGE_SIZE
  end

  # GET /repuesto_servicios/1
  # GET /repuesto_servicios/1.json
  def show
  end

  # GET /repuesto_servicios/new
  def new
    @repuesto_servicio = RepuestoServicio.new
  end

  # GET /repuesto_servicios/1/edit
  def edit
  end

  # POST /repuesto_servicios
  # POST /repuesto_servicios.json
  def create
    @repuesto_servicio = RepuestoServicio.new(repuesto_servicio_params)
    @repuesto_servicio.stock=params[:repuesto_servicio][:stock] = 0.0
    respond_to do |format|
      if @repuesto_servicio.save
        format.html { redirect_to @repuesto_servicio, notice: 'Repuesto o servicio fue creado con éxito.' }
        format.json { render :show, status: :created, location: @repuesto_servicio }
      else
        format.html { render :new }
        format.json { render json: @repuesto_servicio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /repuesto_servicios/1
  # PATCH/PUT /repuesto_servicios/1.json
  def update
    respond_to do |format|
      if @repuesto_servicio.update(repuesto_servicio_params)
        format.html { redirect_to @repuesto_servicio, notice: 'Repuesto o servicio fue actualizado con éxito.' }
        format.json { render :show, status: :ok, location: @repuesto_servicio }
      else
        format.html { render :edit }
        format.json { render json: @repuesto_servicio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /repuesto_servicios/1
  # DELETE /repuesto_servicios/1.json
  def destroy
    if @repuesto_servicio.destroy
            flash[:success] = 'El artículo se ha borrado correctamente.'
        else
            flash[:alert] = 'Hubo errores al intentar borrar artículo.'
        end
        redirect_to repuesto_servicios_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_repuesto_servicio
      @repuesto_servicio = RepuestoServicio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def repuesto_servicio_params
      params.require(:repuesto_servicio).permit(:codigo, :descripcion, :stock, :costo, :precio_venta, :categoria)
    end
end
