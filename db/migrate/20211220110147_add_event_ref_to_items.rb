class AddEventRefToItems < ActiveRecord::Migration[6.1]
  def change
    add_reference :items, :event, foreign_key: true
  end
end
