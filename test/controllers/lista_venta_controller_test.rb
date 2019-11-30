require 'test_helper'

class ListaVentaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lista_venta_index_url
    assert_response :success
  end

  test "should get show" do
    get lista_venta_show_url
    assert_response :success
  end

end
