json.extract! detalle_orden_trabajo, :id, :orden_trabajo_id, :repuesto_servicio_id, :cantidad, :precio_venta, :subtotal, :total, :created_at, :updated_at
json.url detalle_orden_trabajo_url(detalle_orden_trabajo, format: :json)
