class CarrinhoItem < ApplicationRecord
  belongs_to :carrinho, class_name: 'Carrinho'
  belongs_to :produto
end
