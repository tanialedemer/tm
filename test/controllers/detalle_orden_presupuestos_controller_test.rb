require 'test_helper'

class DetalleOrdenPresupuestosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @detalle_orden_presupuesto = detalle_orden_presupuestos(:one)
  end

  test "should get index" do
    get detalle_orden_presupuestos_url
    assert_response :success
  end

  test "should get new" do
    get new_detalle_orden_presupuesto_url
    assert_response :success
  end

  test "should create detalle_orden_presupuesto" do
    assert_difference('DetalleOrdenPresupuesto.count') do
      post detalle_orden_presupuestos_url, params: { detalle_orden_presupuesto: { cantidad: @detalle_orden_presupuesto.cantidad, orden_trabajo_id: @detalle_orden_presupuesto.orden_trabajo_id, precio_unitario: @detalle_orden_presupuesto.precio_unitario, presupuesto_id: @detalle_orden_presupuesto.presupuesto_id, repuesto_servicio_id: @detalle_orden_presupuesto.repuesto_servicio_id, subtotal: @detalle_orden_presupuesto.subtotal, total: @detalle_orden_presupuesto.total } }
    end

    assert_redirected_to detalle_orden_presupuesto_url(DetalleOrdenPresupuesto.last)
  end

  test "should show detalle_orden_presupuesto" do
    get detalle_orden_presupuesto_url(@detalle_orden_presupuesto)
    assert_response :success
  end

  test "should get edit" do
    get edit_detalle_orden_presupuesto_url(@detalle_orden_presupuesto)
    assert_response :success
  end

  test "should update detalle_orden_presupuesto" do
    patch detalle_orden_presupuesto_url(@detalle_orden_presupuesto), params: { detalle_orden_presupuesto: { cantidad: @detalle_orden_presupuesto.cantidad, orden_trabajo_id: @detalle_orden_presupuesto.orden_trabajo_id, precio_unitario: @detalle_orden_presupuesto.precio_unitario, presupuesto_id: @detalle_orden_presupuesto.presupuesto_id, repuesto_servicio_id: @detalle_orden_presupuesto.repuesto_servicio_id, subtotal: @detalle_orden_presupuesto.subtotal, total: @detalle_orden_presupuesto.total } }
    assert_redirected_to detalle_orden_presupuesto_url(@detalle_orden_presupuesto)
  end

  test "should destroy detalle_orden_presupuesto" do
    assert_difference('DetalleOrdenPresupuesto.count', -1) do
      delete detalle_orden_presupuesto_url(@detalle_orden_presupuesto)
    end

    assert_redirected_to detalle_orden_presupuestos_url
  end
end
