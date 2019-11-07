require 'test_helper'

class RepuestoServiciosuggestionControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get repuesto_serviciosuggestion_index_url
    assert_response :success
  end

end
