class CreateProjectThreads < ActiveRecord::Migration[7.0]
  def change
    create_table :project_threads do |t|
      t.references :project, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :title, null: false
      t.text :body

      t.timestamps
    end
  end
end
