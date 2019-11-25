json.extract! detalle_compra, :id, :repuesto_servicio_id, :cantidad, :precio_unitario, :precio_venta, :subtotal, :compra_id, :created_at, :updated_at
json.url detalle_compra_url(detalle_compra, format: :json)
