class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.boolean :completed
      t.datatime :deadline

      t.timestamps
    end
  end
end
