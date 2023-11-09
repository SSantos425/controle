class CreateCarteiras < ActiveRecord::Migration[7.0]
  def change
    create_table :carteiras do |t|
      t.float :saldo
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
