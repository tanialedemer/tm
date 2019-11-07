class DetalleCompra < ApplicationRecord
  belongs_to :compra
  belongs_to :repuesto_servicio
end
