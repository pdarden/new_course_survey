class CreateQuestionGroups < ActiveRecord::Migration
  def change
    create_table :question_groups do |t|
      t.string :survey_title

      t.timestamps
    end
  end
end
