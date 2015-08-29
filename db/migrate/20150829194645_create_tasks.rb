class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.belongs_to :project, index: true, foreign_key: true
      t.string :title

      t.timestamps null: false
    end
  end
end
