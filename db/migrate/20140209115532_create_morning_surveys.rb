class CreateMorningSurveys < ActiveRecord::Migration
  def change
    create_table :morning_surveys do |t|
      t.string :question
      t.string :answer

      t.timestamps
    end
  end
end
