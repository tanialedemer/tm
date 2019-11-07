require 'test_helper'

class OrdenTrabajosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @orden_trabajo = orden_trabajos(:one)
  end

  test "should get index" do
    get orden_trabajos_url
    assert_response :success
  end

  test "should get new" do
    get new_orden_trabajo_url
    assert_response :success
  end

  test "should create orden_trabajo" do
    assert_difference('OrdenTrabajo.count') do
      post orden_trabajos_url, params: { orden_trabajo: { cliente_id: @orden_trabajo.cliente_id, descripcion: @orden_trabajo.descripcion, mecanico_id: @orden_trabajo.mecanico_id, num_orden: @orden_trabajo.num_orden } }
    end

    assert_redirected_to orden_trabajo_url(OrdenTrabajo.last)
  end

  test "should show orden_trabajo" do
    get orden_trabajo_url(@orden_trabajo)
    assert_response :success
  end

  test "should get edit" do
    get edit_orden_trabajo_url(@orden_trabajo)
    assert_response :success
  end

  test "should update orden_trabajo" do
    patch orden_trabajo_url(@orden_trabajo), params: { orden_trabajo: { cliente_id: @orden_trabajo.cliente_id, descripcion: @orden_trabajo.descripcion, mecanico_id: @orden_trabajo.mecanico_id, num_orden: @orden_trabajo.num_orden } }
    assert_redirected_to orden_trabajo_url(@orden_trabajo)
  end

  test "should destroy orden_trabajo" do
    assert_difference('OrdenTrabajo.count', -1) do
      delete orden_trabajo_url(@orden_trabajo)
    end

    assert_redirected_to orden_trabajos_url
  end
end
