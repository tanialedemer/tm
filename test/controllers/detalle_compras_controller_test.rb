require 'test_helper'

class DetalleComprasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @detalle_compra = detalle_compras(:one)
  end

  test "should get index" do
    get detalle_compras_url
    assert_response :success
  end

  test "should get new" do
    get new_detalle_compra_url
    assert_response :success
  end

  test "should create detalle_compra" do
    assert_difference('DetalleCompra.count') do
      post detalle_compras_url, params: { detalle_compra: { cantidad: @detalle_compra.cantidad, compra_id: @detalle_compra.compra_id, iva: @detalle_compra.iva, pago: @detalle_compra.pago, precio_unitario: @detalle_compra.precio_unitario, precio_venta: @detalle_compra.precio_venta, repuesto_servicio_id: @detalle_compra.repuesto_servicio_id, saldo: @detalle_compra.saldo, subtotal: @detalle_compra.subtotal, total: @detalle_compra.total } }
    end

    assert_redirected_to detalle_compra_url(DetalleCompra.last)
  end

  test "should show detalle_compra" do
    get detalle_compra_url(@detalle_compra)
    assert_response :success
  end

  test "should get edit" do
    get edit_detalle_compra_url(@detalle_compra)
    assert_response :success
  end

  test "should update detalle_compra" do
    patch detalle_compra_url(@detalle_compra), params: { detalle_compra: { cantidad: @detalle_compra.cantidad, compra_id: @detalle_compra.compra_id, iva: @detalle_compra.iva, pago: @detalle_compra.pago, precio_unitario: @detalle_compra.precio_unitario, precio_venta: @detalle_compra.precio_venta, repuesto_servicio_id: @detalle_compra.repuesto_servicio_id, saldo: @detalle_compra.saldo, subtotal: @detalle_compra.subtotal, total: @detalle_compra.total } }
    assert_redirected_to detalle_compra_url(@detalle_compra)
  end

  test "should destroy detalle_compra" do
    assert_difference('DetalleCompra.count', -1) do
      delete detalle_compra_url(@detalle_compra)
    end

    assert_redirected_to detalle_compras_url
  end
end
