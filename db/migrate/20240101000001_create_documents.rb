class CreateDocuments < ActiveRecord::Migration[7.1]
  def change
    create_table :documents do |t|
      t.string :tracking_code, null: false, index: { unique: true }
      t.string :original_filename, null: false
      t.string :file, null: false
      t.integer :file_size, null: false
      t.string :mime_type, null: false
      t.string :status, default: 'pending', null: false
      t.text :notes
      t.timestamps
    end
    
    add_index :documents, :status
    add_index :documents, :created_at
  end
end 