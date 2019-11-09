class Compra < ApplicationRecord
  belongs_to :proveedor
  belongs_to :tipo_factura
  has_many :detalle_compras, dependent: :destroy
  accepts_nested_attributes_for :detalle_compras, reject_if: :detalle_compra_rejectable?, allow_destroy: true
  validates :proveedor_id, presence: true

  enum state: [:draft, :confirmed]

  # 
  # def total
	# 	details = self.detalle_compras
  #
	# 	total = 0.0
	# 	details.flat_map do |d|
	# 		total += d.cantidad * d.precio_unitario
	# 	end
	# 	total
	# end

  private

  		def detalle_compra_rejectable?(att)
  			att[:repuesto_servicio_id].blank? || att[:cantidad].blank? || att[:precio_unitario].blank? || att[:cantidad].to_f <= 0 || att[:precio_unitario].to_f <= 0
  		end
end
