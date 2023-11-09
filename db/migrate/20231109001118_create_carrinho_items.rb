class CreateCarrinhoItems < ActiveRecord::Migration[7.0]
  def change
    create_table :carrinho_items do |t|
      t.references :carrinho, null: false, foreign_key: true
      t.references :produto, null: false, foreign_key: true
      t.integer :quantidade

      t.timestamps
    end
  end
end
