class GastosController < ApplicationController
  before_action :set_gasto, only: [:show, :edit, :update, :destroy]
  PAGE_SIZE = 5

  # GET /gastos
  # GET /gastos.json
  def index
    @gastos = Gasto.all
    @page = (params[:page] || 0).to_i

   if params[:keywords].present?
     @keywords = params[:keywords]
     @gastos = Gasto.where("lower(motivo) LIKE '%#{@keywords.downcase}%'").order(:motivo)
                    .offset(PAGE_SIZE * @page).limit(PAGE_SIZE)
     number_of_records = Gasto.where("lower(motivo) LIKE '%#{@keywords.downcase}%'").count
   else
     @gastos = Gasto.order(:motivo).offset(PAGE_SIZE * @page).limit(PAGE_SIZE)
     number_of_records = Gasto.count
   end
   @number_of_pages = (number_of_records % PAGE_SIZE) == 0 ?
                       number_of_records / PAGE_SIZE - 1 : number_of_records / PAGE_SIZE
  end

  # GET /gastos/1
  # GET /gastos/1.json
  def show
  end

  # GET /gastos/new
  def new
    @gasto = Gasto.new(fecha_compra: Date::current)
  end

  # GET /gastos/1/edit
  def edit
  end

  # POST /gastos
  # POST /gastos.json
  def create
    @gasto = Gasto.new(gasto_params)

    respond_to do |format|
      if @gasto.save
        format.html { redirect_to @gasto, notice: 'Gasto was successfully created.' }
        format.json { render :show, status: :created, location: @gasto }
      else
        format.html { render :new }
        format.json { render json: @gasto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gastos/1
  # PATCH/PUT /gastos/1.json
  def update
    respond_to do |format|
      if @gasto.update(gasto_params)
        format.html { redirect_to @gasto, notice: 'Gasto was successfully updated.' }
        format.json { render :show, status: :ok, location: @gasto }
      else
        format.html { render :edit }
        format.json { render json: @gasto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gastos/1
  # DELETE /gastos/1.json
  def destroy
    @gasto.destroy
    respond_to do |format|
      format.html { redirect_to gastos_url, notice: 'Gasto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gasto
      @gasto = Gasto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gasto_params
      params.require(:gasto).permit(:fecha_compra, :motivo, :descripcion, :costo)
    end
end
