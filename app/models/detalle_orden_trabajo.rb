class DetalleOrdenTrabajo < ApplicationRecord


  
  belongs_to :orden_trabajo
  belongs_to :repuesto_servicio

  after_save :quitar_del_inventario
  after_destroy :regresar_al_inventario

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


    def articulo_valido
      unless RepuestoServicio.exists?(self.repuesto_servicio_id)
        errors.add(:msg, "El código #{self.repuesto_servicio_id} no existe")
      end
    end

    def quitar_del_inventario
      repuesto_servicio.stock -= self.cantidad
      repuesto_servicio.save
    end

    def regresar_al_inventario
      repuesto_servicio.stock += self.cantidad
      repuesto_servicio.save
    end

    def self.demanda_articulos
      OrdenTrabajo.group(:repuesto_servicio_id).order('count(*) desc').limit(7).count
    end
end
