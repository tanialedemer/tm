Rails.application.routes.draw do

  resources :compras do
    resources :detalle_compras
  end

  get 'compra/:id/factura/', to: 'compras#factura', as: 'compra_factura'
  get 'presupuesto/:id/factura/', to: 'presupuestos#factura', as: 'presupuesto_factura'


  get '/items_suggestion', to: 'items_suggestion#index'
  get '/validate_suggested_item', to: 'validate_suggested_item#index'
  # get 'repuesto_serviciosuggestion/index'

  resources :payments do
    end


  resources :compras do
    end

  resources :presupuestos do
    resources :detalle_orden_presupuestos
  end


  resources :orden_trabajos do
    resources :detalle_orden_trabajos
  end

  resources :detalle_compras do
   get :autocomplete_product_name, on: :collection
  end

  resources :venta
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
