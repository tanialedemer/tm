class DetalleCompra < ApplicationRecord
  belongs_to :compra
  belongs_to :repuesto_servicio

  validates :repuesto_servicio_id, presence: true
  validates :cantidad, presence: true
  validates :precio_unitario, presence: true
  validates :precio_venta, presence: true
  validates :subtotal, presence: true
  # validates :total, presence: true

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
