class DetalleCompra < ApplicationRecord

  belongs_to :repuesto_servicio
  belongs_to :compra

  validates :repuesto_servicio_id, presence: true
  validates :cantidad, presence: true
  validates :precio_unitario, presence: true
  validates :precio_venta, presence: true
  
  # after_save :sumar_stock


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

  # def sumar_stock
  #   self.repuesto_servicio.stock += self.cantidad
  #   self.repuesto_servicio.save
  # end

end
