require 'test_helper'

class PagoFacturasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pago_factura = pago_facturas(:one)
  end

  test "should get index" do
    get pago_facturas_url
    assert_response :success
  end

  test "should get new" do
    get new_pago_factura_url
    assert_response :success
  end

  test "should create pago_factura" do
    assert_difference('PagoFactura.count') do
      post pago_facturas_url, params: { pago_factura: { compra_id: @pago_factura.compra_id, fecha: @pago_factura.fecha, monto_pago: @pago_factura.monto_pago, proveedor_id: @pago_factura.proveedor_id } }
    end

    assert_redirected_to pago_factura_url(PagoFactura.last)
  end

  test "should show pago_factura" do
    get pago_factura_url(@pago_factura)
    assert_response :success
  end

  test "should get edit" do
    get edit_pago_factura_url(@pago_factura)
    assert_response :success
  end

  test "should update pago_factura" do
    patch pago_factura_url(@pago_factura), params: { pago_factura: { compra_id: @pago_factura.compra_id, fecha: @pago_factura.fecha, monto_pago: @pago_factura.monto_pago, proveedor_id: @pago_factura.proveedor_id } }
    assert_redirected_to pago_factura_url(@pago_factura)
  end

  test "should destroy pago_factura" do
    assert_difference('PagoFactura.count', -1) do
      delete pago_factura_url(@pago_factura)
    end

    assert_redirected_to pago_facturas_url
  end
end
