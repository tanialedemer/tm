class OrdenTrabajo < ApplicationRecord
  belongs_to :empleado
  belongs_to :cliente
  has_many :detalle_orden_trabajos, dependent: :destroy
  accepts_nested_attributes_for :detalle_orden_trabajos, allow_destroy: true

    def total
    details = self.detalle_orden_trabajos

    total = 0.0
    details.flat_map do |d|
      total += d.cantidad * d.precio_venta
    end
    total
  end
end
