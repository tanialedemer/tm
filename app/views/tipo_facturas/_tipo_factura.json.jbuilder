json.extract! tipo_factura, :id, :descripcion, :created_at, :updated_at
json.url tipo_factura_url(tipo_factura, format: :json)
