class CreateAttachments < ActiveRecord::Migration[7.0]
  def change
    create_table :attachments do |t|
      t.references :project, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :filename, null: false
      t.string :content_type

      t.timestamps
    end
  end
end
