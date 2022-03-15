class CreateAchievements < ActiveRecord::Migration[6.0]
  def change
    create_table :achievements do |t|
      t.references :user, null: false 
      t.references :task, null: false 
      t.timestamps
    end
  end
end
