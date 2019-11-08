class Compra < ApplicationRecord
  belongs_to :proveedor
  belongs_to :tipo_factura
  has_many :detalle_compras, dependent: :destroy
  accepts_nested_attributes_for :detalle_compras, allow_destroy: true

end
