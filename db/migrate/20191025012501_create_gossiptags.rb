class CreateGossiptags < ActiveRecord::Migration[5.2]
  def change
    create_table :gossiptags do |t|

      t.timestamps
    end
  end
end
