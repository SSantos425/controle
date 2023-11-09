class Carrinho < ApplicationRecord
  belongs_to :user
  has_many :carrinho_itens, dependent: :destroy, class_name: 'CarrinhoItem'
end
