class Payment < ApplicationRecord
  belongs_to :proveedor
  belongs_to :tipo_factura
  has_many :payment_details,  inverse_of: :payment, dependent: :destroy
  has_many :repuesto_servicio, through: :payment_details

  #validaciones
  validates :num_fact, presence: true
	validates :fecha, presence: true
  validates :proveedor_id, presence: true
	validates :tipo_factura_id, presence: true

  #nested
  accepts_nested_attributes_for :payment_details, reject_if: :payment_detail_rejectable?,	allow_destroy: true

  enum estado: [:draft, :confirmed]

	def total
		details = self.payment_details

		total = 0.0
		details.flat_map do |d|
			total += d.cantidad * d.precio_unitario
		end
		total
	end

	private

		def payment_detail_rejectable?(att)
			att[:repuesto_servicio_id].blank? || att[:cantidad].blank? || att[:precio_unitario].blank? || att[:cantidad].to_f <= 0 || att[:precio_unitario].to_f <= 0
		end
end
