json.extract! proveedor, :id, :nombre, :direccion, :telefono, :email, :ruc, :created_at, :updated_at
json.url proveedor_url(proveedor, format: :json)
