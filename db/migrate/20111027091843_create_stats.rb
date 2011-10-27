class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.string :printer_name
      t.integer :total_pages
      t.integer :black_pages
      t.integer :colour_pages
      t.datetime :last_check

      t.timestamps
    end
  end
end
