class DetalleOrdenTrabajo < ApplicationRecord

  after_save :save_stock
  
  belongs_to :orden_trabajo
  belongs_to :repuesto_servicio

      def subtotal
      self.cantidad ? cantidad * unit_price : 0
    end

    def unit_price
      if persisted?
        precio_venta
      else
        repuesto_servicio ? repuesto_servicio.costo : 0
      end
    end


private
  def save_stock
    inventario = repuesto_servicio.stock + cantidad
        self.repuesto_servicio.update!(stock: inventario)
  end
end
