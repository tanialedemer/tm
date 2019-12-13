class ProveedorsController < ApplicationController
  before_action :set_proveedor, only: [:show, :edit, :update, :destroy]
  PAGE_SIZE = 5
  # GET /proveedors
  # GET /proveedors.json
  def index
    @proveedors = Proveedor.all
      respond_to do |format|
      format.html
      format.pdf do
        pdf = ProveedorsPdf.new(@proveedors)
        send_data pdf.render, filename: 'proveedors.pdf', type: 'application/pdf', disposition: 'inline'
      end
    end

    @page = (params[:page] || 0).to_i

   if params[:keywords].present?
     @keywords = params[:keywords]
     @proveedors = Proveedor.where("lower(nombre) LIKE '%#{@keywords.downcase}%'").order(:nombre)
                    .offset(PAGE_SIZE * @page).limit(PAGE_SIZE)
     number_of_records = Proveedor.where("lower(nombre) LIKE '%#{@keywords.downcase}%'").count
   else
     @proveedors = Proveedor.order(:nombre).offset(PAGE_SIZE * @page).limit(PAGE_SIZE)
     number_of_records = Proveedor.count
   end
   @number_of_pages = (number_of_records % PAGE_SIZE) == 0 ?
                       number_of_records / PAGE_SIZE - 1 : number_of_records / PAGE_SIZE
  end

  # GET /proveedors/1
  # GET /proveedors/1.json
  def show
  end

  # GET /proveedors/new
  def new
    @proveedor = Proveedor.new
  end

  # GET /proveedors/1/edit
  def edit
  end

  # POST /proveedors
  # POST /proveedors.json
  def create
    @proveedor = Proveedor.new(proveedor_params)

    respond_to do |format|
      if @proveedor.save
        format.html { redirect_to @proveedor, notice: 'Proveedor fue creado con éxito.' }
        format.json { render :show, status: :created, location: @proveedor }
      else
        format.html { render :new }
        format.json { render json: @proveedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proveedors/1
  # PATCH/PUT /proveedors/1.json
  def update
    respond_to do |format|
      if @proveedor.update(proveedor_params)
        format.html { redirect_to @proveedor, notice: 'Proveedor fue actualizado con éxito.' }
        format.json { render :show, status: :ok, location: @proveedor }
      else
        format.html { render :edit }
        format.json { render json: @proveedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proveedors/1
  # DELETE /proveedors/1.json
  def destroy
    @proveedor.destroy
    respond_to do |format|
      format.html { redirect_to proveedors_url, notice: 'Proveedor fue eliminado con éxito.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proveedor
      @proveedor = Proveedor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proveedor_params
      params.require(:proveedor).permit(:nombre, :direccion, :telefono, :email, :ruc)
    end
end
