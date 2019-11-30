json.extract! orden_trabajo, :id, :descripcion, :mecanico_id, :cliente_id, :num_orden, :total, :created_at, :updated_at
json.url orden_trabajo_url(orden_trabajo, format: :json)
