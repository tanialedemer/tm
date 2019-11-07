require 'test_helper'

class RepuestoServiciosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @repuesto_servicio = repuesto_servicios(:one)
  end

  test "should get index" do
    get repuesto_servicios_url
    assert_response :success
  end

  test "should get new" do
    get new_repuesto_servicio_url
    assert_response :success
  end

  test "should create repuesto_servicio" do
    assert_difference('RepuestoServicio.count') do
      post repuesto_servicios_url, params: { repuesto_servicio: { categoria: @repuesto_servicio.categoria, codigo: @repuesto_servicio.codigo, costo: @repuesto_servicio.costo, descripcion: @repuesto_servicio.descripcion, precio_venta: @repuesto_servicio.precio_venta, stock: @repuesto_servicio.stock } }
    end

    assert_redirected_to repuesto_servicio_url(RepuestoServicio.last)
  end

  test "should show repuesto_servicio" do
    get repuesto_servicio_url(@repuesto_servicio)
    assert_response :success
  end

  test "should get edit" do
    get edit_repuesto_servicio_url(@repuesto_servicio)
    assert_response :success
  end

  test "should update repuesto_servicio" do
    patch repuesto_servicio_url(@repuesto_servicio), params: { repuesto_servicio: { categoria: @repuesto_servicio.categoria, codigo: @repuesto_servicio.codigo, costo: @repuesto_servicio.costo, descripcion: @repuesto_servicio.descripcion, precio_venta: @repuesto_servicio.precio_venta, stock: @repuesto_servicio.stock } }
    assert_redirected_to repuesto_servicio_url(@repuesto_servicio)
  end

  test "should destroy repuesto_servicio" do
    assert_difference('RepuestoServicio.count', -1) do
      delete repuesto_servicio_url(@repuesto_servicio)
    end

    assert_redirected_to repuesto_servicios_url
  end
end
