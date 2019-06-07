class CreateHosts < ActiveRecord::Migration[5.2]
  def change
    create_table :hosts do |t|
      t.string :name            
      t.integer :hat_id
      t.integer :user_id
      t.datetime :completed_at

      t.timestamps  
    end
  end
end
