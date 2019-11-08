class DetalleCompra < ApplicationRecord
  belongs_to :compra
  belongs_to :repuesto_servicio

  def subtotal
    self.cantidad ? cantidad * unit_price : 0
  end

  def unit_price
    if persisted?
      precio_unitario
    else
      repuesto_servicio ? repuesto_servicio.costo : 0
    end
  end


  # def total
	# 	details = self.detalle_compra
  #
	# 	total = 0.0
	# 	details.flat_map do |d|
	# 		total += d.cantidad * d.precio_unitario
	# 	end
	# 	total
	# end

end
