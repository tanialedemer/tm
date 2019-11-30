class ServicioCompra
  attr_accessor :detalle_compra, :repuesto_servicio

  def initialize(detalle_compra, repuesto_servicio)
    @detalle_compra = detalle_compra
    @repuesto_servicio = repuesto_servicio
  end

  def realizar_compra
    detalle_compra.repuesto_servicio = repuesto_servicio
    repuesto_servicio.stock -= detalle_compra.cantidad

    detalle_compra.save && repuesto_servicio.save
  end
end