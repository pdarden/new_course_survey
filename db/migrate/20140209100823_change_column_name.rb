class ChangeColumnName < ActiveRecord::Migration
  def up
    remove_column :answers, :response
    add_column :answers, :option_id, :integer
  end

  def down
    add_column :answers, :response, :string
    remove_column :answers, :option_id
  end
end
