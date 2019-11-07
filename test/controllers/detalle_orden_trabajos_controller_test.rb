require 'test_helper'

class DetalleOrdenTrabajosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @detalle_orden_trabajo = detalle_orden_trabajos(:one)
  end

  test "should get index" do
    get detalle_orden_trabajos_url
    assert_response :success
  end

  test "should get new" do
    get new_detalle_orden_trabajo_url
    assert_response :success
  end

  test "should create detalle_orden_trabajo" do
    assert_difference('DetalleOrdenTrabajo.count') do
      post detalle_orden_trabajos_url, params: { detalle_orden_trabajo: { cantidad: @detalle_orden_trabajo.cantidad, orden_trabajo_id: @detalle_orden_trabajo.orden_trabajo_id, precio_venta: @detalle_orden_trabajo.precio_venta, repuesto_servicio_id: @detalle_orden_trabajo.repuesto_servicio_id, subtotal: @detalle_orden_trabajo.subtotal, total: @detalle_orden_trabajo.total } }
    end

    assert_redirected_to detalle_orden_trabajo_url(DetalleOrdenTrabajo.last)
  end

  test "should show detalle_orden_trabajo" do
    get detalle_orden_trabajo_url(@detalle_orden_trabajo)
    assert_response :success
  end

  test "should get edit" do
    get edit_detalle_orden_trabajo_url(@detalle_orden_trabajo)
    assert_response :success
  end

  test "should update detalle_orden_trabajo" do
    patch detalle_orden_trabajo_url(@detalle_orden_trabajo), params: { detalle_orden_trabajo: { cantidad: @detalle_orden_trabajo.cantidad, orden_trabajo_id: @detalle_orden_trabajo.orden_trabajo_id, precio_venta: @detalle_orden_trabajo.precio_venta, repuesto_servicio_id: @detalle_orden_trabajo.repuesto_servicio_id, subtotal: @detalle_orden_trabajo.subtotal, total: @detalle_orden_trabajo.total } }
    assert_redirected_to detalle_orden_trabajo_url(@detalle_orden_trabajo)
  end

  test "should destroy detalle_orden_trabajo" do
    assert_difference('DetalleOrdenTrabajo.count', -1) do
      delete detalle_orden_trabajo_url(@detalle_orden_trabajo)
    end

    assert_redirected_to detalle_orden_trabajos_url
  end
end
