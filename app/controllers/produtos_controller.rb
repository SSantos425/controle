class ProdutosController < ApplicationController
    before_action :authenticate_user!
    def index
      @produtos = Produto.all
      @users = User.all
      #@carrinhos = Carrinho.all
    end

    def new
        @produto = Produto.new
    end

    def create
        @produto = Produto.new(produto_params)

        if @produto.save
            redirect_to root_path
        else
            render :new, status: :unprocessable_entity
        end
      
    end
  
    def comprar
        produto = Produto.find(params[:id])
        quantidade_comprada = params[:produto][:quantidade].to_i
  
        produto.update(quantidade: produto.quantidade + quantidade_comprada)
        flash[:notice] = "Produto comprado com sucesso!"
        
        redirect_to produtos_path
      end
  
    def vender
        #venda do produto e atualiza a quantiade
        produto = Produto.find(params[:id])
        quantidade_vendida = params[:produto][:quantidade].to_i
        produto.update(quantidade: produto.quantidade - quantidade_vendida)
        flash[:notice] = "Produto vendido com sucesso!"


        #adiciona o valor vendido no saldo do usuario logado
        user = current_user
        carteira = user.carteira
        valor_venda = produto.preco * quantidade_vendida
        carteira.update(saldo: carteira.saldo + valor_venda)


        # Suponha que o usuário tenha uma carteira onde o valor seja armazenado.
        # Você pode adicionar lógica para atualizar a carteira do usuário aqui.
        redirect_to produtos_path
    end
    
    def adicionar_ao_carrinho
        produto = Produto.find(params[:id])
        quantidade_adicionada = params[:produto][:quantidade].to_i

    
        carrinho = current_user.carrinho

        carrinho_item = carrinho.carrinho_itens.find_or_initialize_by(produto_id: produto.id)
        carrinho_item.quantidade += quantidade_adicionada

        if carrinho_item.save
            flash[:notice] = "Produto adicionado ao carrinho."
        else
            flash[:alert] = "Erro ao adicionar o produto ao carrinho."
        end
        
        redirect_to produtos_path
    end

    def remover_do_carrinho
        carrinho_item = CarrinhoItem.find(params[:id])

        if carrinho_item.destroy
        flash[:notice] = "Produto removido do carrinho."
        else
        flash[:alert] = "Erro ao remover o produto do carrinho."
        end
        redirect_to produtos_path
    end

    def finalizar_venda
        carrinho = current_user.carrinho
        carrinho.carrinho_itens.each do |carrinho_item|
            venda = Venda.new(user: current_user, produto: carrinho_item.produto, quantidade: carrinho_item.quantidade, data: Time.now)
            venda.save
            carrinho_item.destroy
        end

        flash[:notice] = "venda finalizada com sucesso."
        redirect_to produtos_path
    end

    def historico_vendas
        @vendas = current_user.vendas
      
    end

    private
        def produto_params
            params.require(:produto).permit(:nome,:quantidade,:preco)
          
        end

end
  