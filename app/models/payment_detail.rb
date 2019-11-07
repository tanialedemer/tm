class PaymentDetail < ApplicationRecord
  belongs_to :payment
  belongs_to :repuesto_servicio

  #validaciones
  validates :repuesto_servicio_id, presence: true
	validates :cantidad, presence: true
	validates :precio_unitario, presence: true
  validates :precio_venta, presence: true


	accepts_nested_attributes_for :repuesto_servicio


	def subtotal
		self.cantidad ? cantidad * unit_price : 0
	end

	def unit_price
		if persisted?
			precio_unitario
		else
			repuesto_servicio ? repuesto_servicio.precio_unitario : 0
		end
	end
end
