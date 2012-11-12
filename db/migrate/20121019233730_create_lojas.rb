class CreateLojas < ActiveRecord::Migration
  def change
    create_table :lojas do |t|
      t.string :nome
      t.string :url
      t.string :pattern_preco

      t.timestamps
    end
  end
end
