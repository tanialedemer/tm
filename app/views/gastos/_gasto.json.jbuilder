json.extract! gasto, :id, :fecha_compra, :motivo, :descripcion, :costo, :created_at, :updated_at
json.url gasto_url(gasto, format: :json)
