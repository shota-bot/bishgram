class CreatePostMemberRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :post_member_relations do |t|
      t.references :post, foreign_key: true
      t.integer :member_id,  null: false

      t.timestamps
    end
  end
end
