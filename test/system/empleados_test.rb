require "application_system_test_case"

class EmpleadosTest < ApplicationSystemTestCase
  setup do
    @empleado = empleados(:one)
  end

  test "visiting the index" do
    visit empleados_url
    assert_selector "h1", text: "Empleados"
  end

  test "creating a Empleado" do
    visit empleados_url
    click_on "New Empleado"

    fill_in "Apellido", with: @empleado.apellido
    fill_in "Direccion", with: @empleado.direccion
    fill_in "Documento", with: @empleado.documento
    fill_in "Especialidad", with: @empleado.especialidad
    fill_in "Fecha contratacion", with: @empleado.fecha_contratacion
    fill_in "Fecha nac", with: @empleado.fecha_nac
    fill_in "Nombre", with: @empleado.nombre
    fill_in "Salario", with: @empleado.salario
    fill_in "Telefono", with: @empleado.telefono
    fill_in "Usuario", with: @empleado.usuario_id
    click_on "Create Empleado"

    assert_text "Empleado was successfully created"
    click_on "Back"
  end

  test "updating a Empleado" do
    visit empleados_url
    click_on "Edit", match: :first

    fill_in "Apellido", with: @empleado.apellido
    fill_in "Direccion", with: @empleado.direccion
    fill_in "Documento", with: @empleado.documento
    fill_in "Especialidad", with: @empleado.especialidad
    fill_in "Fecha contratacion", with: @empleado.fecha_contratacion
    fill_in "Fecha nac", with: @empleado.fecha_nac
    fill_in "Nombre", with: @empleado.nombre
    fill_in "Salario", with: @empleado.salario
    fill_in "Telefono", with: @empleado.telefono
    fill_in "Usuario", with: @empleado.usuario_id
    click_on "Update Empleado"

    assert_text "Empleado was successfully updated"
    click_on "Back"
  end

  test "destroying a Empleado" do
    visit empleados_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Empleado was successfully destroyed"
  end
end
