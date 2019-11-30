# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_25_151000) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categoria", force: :cascade do |t|
    t.string "descripcion"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "clientes", force: :cascade do |t|
    t.string "nombre"
    t.string "apellido"
    t.text "direccion"
    t.string "telefono"
    t.text "email"
    t.string "documento"
    t.integer "ruc"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "compras", force: :cascade do |t|
    t.date "fecha"
    t.integer "num_fact"
    t.float "total"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "proveedor_id"
  end

  create_table "detalle_compras", force: :cascade do |t|
    t.bigint "repuesto_servicio_id", null: false
    t.float "cantidad"
    t.float "precio_unitario"
    t.float "precio_venta"
    t.float "subtotal"
    t.bigint "compra_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["compra_id"], name: "index_detalle_compras_on_compra_id"
    t.index ["repuesto_servicio_id"], name: "index_detalle_compras_on_repuesto_servicio_id"
  end

  create_table "detalle_orden_presupuestos", force: :cascade do |t|
    t.bigint "presupuesto_id", null: false
    t.bigint "repuesto_servicio_id", null: false
    t.float "cantidad"
    t.float "precio_unitario"
    t.float "subtotal"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["presupuesto_id"], name: "index_detalle_orden_presupuestos_on_presupuesto_id"
    t.index ["repuesto_servicio_id"], name: "index_detalle_orden_presupuestos_on_repuesto_servicio_id"
  end

  create_table "detalle_orden_trabajos", force: :cascade do |t|
    t.bigint "orden_trabajo_id", null: false
    t.bigint "repuesto_servicio_id", null: false
    t.float "cantidad"
    t.float "precio_venta"
    t.float "subtotal"
    t.float "total"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["orden_trabajo_id"], name: "index_detalle_orden_trabajos_on_orden_trabajo_id"
    t.index ["repuesto_servicio_id"], name: "index_detalle_orden_trabajos_on_repuesto_servicio_id"
  end

  create_table "empleados", force: :cascade do |t|
    t.string "nombre"
    t.string "apellido"
    t.date "fecha_nac"
    t.string "documento"
    t.string "telefono"
    t.string "especialidad"
    t.date "fecha_contratacion"
    t.float "salario"
    t.text "direccion"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "gastos", force: :cascade do |t|
    t.date "fecha_compra"
    t.string "motivo"
    t.string "descripcion"
    t.float "costo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "mecanicos", force: :cascade do |t|
    t.string "especialidad"
    t.bigint "empleado_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["empleado_id"], name: "index_mecanicos_on_empleado_id"
  end

  create_table "orden_trabajos", force: :cascade do |t|
    t.text "descripcion"
    t.bigint "empleado_id", null: false
    t.bigint "cliente_id", null: false
    t.integer "num_orden"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cliente_id"], name: "index_orden_trabajos_on_cliente_id"
    t.index ["empleado_id"], name: "index_orden_trabajos_on_mecanico_id"
  end

  create_table "presupuestos", force: :cascade do |t|
    t.text "descripcion"
    t.bigint "cliente_id", null: false
    t.float "total"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cliente_id"], name: "index_presupuestos_on_cliente_id"
  end

  create_table "proveedors", force: :cascade do |t|
    t.string "nombre"
    t.text "direccion"
    t.string "telefono"
    t.text "email"
    t.string "ruc"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "repuesto_servicios", force: :cascade do |t|
    t.string "codigo"
    t.text "descripcion"
    t.integer "stock"
    t.float "costo"
    t.float "precio_venta"
    t.string "categoria"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "tipo_facturas", force: :cascade do |t|
    t.string "descripcion"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: ""
    t.string "username", default: ""
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  create_table "vehiculos", force: :cascade do |t|
    t.string "modelo"
    t.string "color"
    t.string "matricula"
    t.string "marca"
    t.float "km"
    t.string "chasis"
    t.integer "year_fab"
    t.bigint "cliente_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cliente_id"], name: "index_vehiculos_on_cliente_id"
  end

  create_table "venta", force: :cascade do |t|
    t.bigint "cliente_id", null: false
    t.date "fecha"
    t.bigint "orden_trabajo_id", null: false
    t.string "estado"
    t.float "subtotal"
    t.float "total"
    t.float "saldo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cliente_id"], name: "index_venta_on_cliente_id"
    t.index ["orden_trabajo_id"], name: "index_venta_on_orden_trabajo_id"
  end

  add_foreign_key "detalle_compras", "compras"
  add_foreign_key "detalle_compras", "repuesto_servicios"
  add_foreign_key "detalle_orden_presupuestos", "presupuestos"
  add_foreign_key "detalle_orden_presupuestos", "repuesto_servicios"
  add_foreign_key "detalle_orden_trabajos", "orden_trabajos"
  add_foreign_key "detalle_orden_trabajos", "repuesto_servicios"
  add_foreign_key "mecanicos", "empleados"
  add_foreign_key "orden_trabajos", "clientes"
  add_foreign_key "orden_trabajos", "mecanicos", column: "empleado_id"
  add_foreign_key "presupuestos", "clientes"
  add_foreign_key "vehiculos", "clientes"
  add_foreign_key "venta", "clientes"
  add_foreign_key "venta", "orden_trabajos"
end
