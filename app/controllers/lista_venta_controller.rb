class ListaVentaController < ApplicationController
  def index
  	params[:q] ||= {}
    if params[:q][:created_at_lteq].present?
      params[:q][:created_at_lteq] = params[:q][:created_at_lteq].to_date.end_of_day
    end

    # Filter data by search send by view
    @q = Ventum.ransack(params[:q])
    @venta = Ventum.all

  end

  def show
    @venta = Ventum.find(params[:id])
  end
end
