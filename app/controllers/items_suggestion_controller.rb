class ItemsSuggestionController < ApplicationController
	def index
		if params[:query].present?
			query = params[:query]
			condition = "unaccent(lower(descripcion)) LIKE '%#{I18n.transliterate(query.downcase)}%'"
      @repuesto_servicios = RepuestoServicio.where(condition)
			end
      @repuesto_servicios ||= RepuestoServicio.none
      render json: @repuesto_servicios
		end
end
