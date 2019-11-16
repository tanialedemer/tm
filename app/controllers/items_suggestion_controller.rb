class ItemsSuggestionController < ApplicationController
	def index
		if params[:query].present?
			query = params[:query]
			condition = "unaccent(lower(repuesto_servicios.descripcion)) LIKE '%#{I18n.transliterate(query.downcase)}%'"
      @repuesto_servicios = RepuestoServicio.where(condition)
			@repuesto_servicios.each do |repuesto_servicio|
				repuesto_servicio.descripcion = repuesto_servicios.descripcion
			end
      @repuesto_servicios ||= RepuestoServicio.none
      render json: @repuesto_servicios
		end
end
