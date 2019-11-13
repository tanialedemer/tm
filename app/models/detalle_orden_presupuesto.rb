class DetalleOrdenPresupuesto < ApplicationRecord
  belongs_to :presupuesto
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
end
