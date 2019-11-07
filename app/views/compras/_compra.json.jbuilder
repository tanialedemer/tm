json.extract! compra, :id, :fecha, :proveedor_id, :tipo_factura_id, :num_fact, :estado, :created_at, :updated_at
json.url compra_url(compra, format: :json)
