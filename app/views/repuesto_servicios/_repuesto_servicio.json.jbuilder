json.extract! repuesto_servicio, :id, :codigo, :descripcion, :stock, :costo, :precio_venta, :categoria, :created_at, :updated_at
json.url repuesto_servicio_url(repuesto_servicio, format: :json)
