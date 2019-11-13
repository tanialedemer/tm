class ValidateSuggestedItemController < ApplicationController
  def index
  		repuesto_servicio = []
		if params[:descripcion].present?
			descripcion = params[:descripcion]
			condition = "unaccent(lower(descripcion)) = '#{I18n.transliterate(descripcion.downcase)}'"
      repuesto_servicio = RepuestoServicio.where(condition)
		end
		if !repuesto_servicio.empty?
			result = [valid: true, id: repuesto_servicio.first.id, precio_venta: repuesto_servicio.first.precio_venta]
		else
			result = [valid: false, id: 0]
		end
		render json: result
  end
end
