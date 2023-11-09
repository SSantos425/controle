# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


user = User.create(email:"admin@admin.com",password:123456)

carteira = Carteira.create(saldo:0, user_id: user.id)

carrinho = Carrinho.create(user_id: user.id)



produto1 = Produto.create(nome:"RIPA", quantidade:10, preco:500)
produto2 = Produto.create(nome:"SARRAFO", quantidade:15, preco:400)

carrinho_item1 = CarrinhoItem.create(carrinho_id: carrinho.id, produto_id: produto1.id, quantidade: 2)
carrinho_item2 = CarrinhoItem.create(carrinho_id: carrinho.id, produto_id: produto2.id, quantidade: 3)