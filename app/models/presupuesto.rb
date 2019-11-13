class Presupuesto < ApplicationRecord
  belongs_to :cliente
  has_many :detalle_orden_presupuestos, dependent: :destroy
  accepts_nested_attributes_for :detalle_orden_presupuestos,reject_if: :detalle_orden_presupuesto_rejectable?,
   allow_destroy: true

  def total
    details = self.detalle_orden_presupuestos

    total = 0.0
    details.flat_map do |d|
      total += d.cantidad * d.precio_unitario
    end
    total
  end

  private

      def detalle_orden_presupuesto_rejectable?(att)
        att[:repuesto_servicio_id].blank? || att[:cantidad].blank? || att[:precio_unitario].blank? || att[:cantidad].to_f <= 0 || att[:precio_unitario].to_f <= 0
      end
end
