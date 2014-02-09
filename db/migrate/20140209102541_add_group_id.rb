class AddGroupId < ActiveRecord::Migration
  def change
    add_column :questions, :question_group_id, :integer
    add_column :answers, :question_id, :integer
    add_column :options, :question_id, :integer
  end
end
