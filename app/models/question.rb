class Question < ActiveRecord::Base
  belongs_to :question_group
  has_many :options
  has_one :answer

  accepts_nested_attributes_for :options
  accepts_nested_attributes_for :answer
end
