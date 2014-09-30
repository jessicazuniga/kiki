class CreateCurrentGroups < ActiveRecord::Migration
  def change
    create_table :current_groups do |t|
      t.integer :user_id
      t.integer :group_id

      t.timestamps
    end
  end
end
