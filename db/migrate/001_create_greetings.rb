class CreateGreetings < ActiveRecord::Migration[7.0]
  def change
    create_table :greetings do |t|
      t.string :name, null: false
      t.text :message, null: false
      t.timestamps
    end
    
    add_index :greetings, :name
  end
end