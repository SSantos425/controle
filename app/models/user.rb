class User < ApplicationRecord

  has_one :carteira
  has_one :carrinho

  has_many :vendas

  #after_create :create_carteira

  private

    def create_carteira
      # Cria uma carteira associada a este usuário
      self.build_carteira(saldo: 0.0)
    end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
