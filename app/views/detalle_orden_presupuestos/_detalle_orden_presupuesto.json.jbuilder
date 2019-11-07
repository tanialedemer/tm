json.extract! detalle_orden_presupuesto, :id, :orden_trabajo_id, :presupuesto_id, :repuesto_servicio_id, :cantidad, :precio_unitario, :subtotal, :total, :created_at, :updated_at
json.url detalle_orden_presupuesto_url(detalle_orden_presupuesto, format: :json)
