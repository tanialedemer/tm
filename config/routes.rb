Rails.application.routes.draw do

  get '/items_suggestion', to: 'items_suggestion#index'
  get '/validate_suggested_item', to: 'validate_suggested_item#index'
  # get 'repuesto_serviciosuggestion/index'

  resources :payments do
    resources :payment_details
  end


  resources :compras do
    resources :detalle_compras
  end

  resources :presupuestos do
    resources :detalle_orden_presupuestos
  end


  resources :orden_trabajos do
    resources :detalle_orden_trabajos
  end


  resources :venta
  resources :pago_facturas
  resources :vehiculos
  resources :tipo_facturas
  resources :repuesto_servicios
  resources :categoria
  resources :mecanicos
  resources :empleados
  resources :proveedors
  resources :clientes
  resources :gastos
  devise_for :users
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
