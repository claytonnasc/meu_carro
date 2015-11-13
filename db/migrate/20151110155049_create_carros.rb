class CreateCarros < ActiveRecord::Migration
  def change
    create_table :carros do |t|
      t.string :nome
      t.string :cor
      t.string :descricao
      t.string :ano

      t.timestamps null: false
    end
  end
end
