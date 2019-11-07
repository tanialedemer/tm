require 'test_helper'

class TipoFacturasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_factura = tipo_facturas(:one)
  end

  test "should get index" do
    get tipo_facturas_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_factura_url
    assert_response :success
  end

  test "should create tipo_factura" do
    assert_difference('TipoFactura.count') do
      post tipo_facturas_url, params: { tipo_factura: { descripcion: @tipo_factura.descripcion } }
    end

    assert_redirected_to tipo_factura_url(TipoFactura.last)
  end

  test "should show tipo_factura" do
    get tipo_factura_url(@tipo_factura)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_factura_url(@tipo_factura)
    assert_response :success
  end

  test "should update tipo_factura" do
    patch tipo_factura_url(@tipo_factura), params: { tipo_factura: { descripcion: @tipo_factura.descripcion } }
    assert_redirected_to tipo_factura_url(@tipo_factura)
  end

  test "should destroy tipo_factura" do
    assert_difference('TipoFactura.count', -1) do
      delete tipo_factura_url(@tipo_factura)
    end

    assert_redirected_to tipo_facturas_url
  end
end
