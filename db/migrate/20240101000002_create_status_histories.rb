class CreateStatusHistories < ActiveRecord::Migration[7.1]
  def change
    create_table :status_histories do |t|
      t.references :document, null: false, foreign_key: true
      t.string :status, null: false
      t.text :notes
      t.datetime :updated_at, null: false
    end
    
    add_index :status_histories, :status
    add_index :status_histories, :updated_at
  end
end 