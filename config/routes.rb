Rails.application.routes.draw do
  get 'home_page/index'
  devise_for :users
  resources :produtos


  post 'produtos/comprar/:id', to: 'produtos#comprar', as: 'comprar_produto'
  post 'produtos/vender/:id', to: 'produtos#vender', as: 'vender_produto'
  #root 'produtos#index'
  root 'home_page#index'

  #adiciona e remove itens do quadrinho
  post 'produtos/adicionar_ao_carrinho/:id', to: 'produtos#adicionar_ao_carrinho', as: 'adicionar_ao_carrinho'
  delete 'produtos/remover_do_carrinho/:id', to: 'produtos#remover_do_carrinho', as: 'remover_do_carrinho'

  get 'carrinho', to: 'produtos#carrinho', as: 'carrinho'
  get 'historico_vendas', to: 'produtos#historico_vendas', as: 'historico_vendas'
  post 'finalizar_venda', to: 'produtos#finalizar_venda', as: 'finalizar_venda'
end
