class PagoFactura < ApplicationRecord
  belongs_to :compra
  belongs_to :proveedor
end
