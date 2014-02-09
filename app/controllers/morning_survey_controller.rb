class MorningSurveyController < ApplicationController

def new
    binding.pry
    @number = 1
    @survey_questions = get_json
    # @question_group = QuestionGroup.new(:survey_title => @survey_questions["survey_title"])
    @page = MorningSurvey.new#(:survey_title => @survey_questions["survey_title"])
    @question_array = []
    @option_array = []
    @survey_questions["questions"].each do |bam|
      bam.each do |questionLetter, questionHash|
      questionHash.each do |question, optionsHash|
        @question_array << question
        optionsHash.each do |optionNumber, option|
          @question_option_array = []
          @question_option_array << option
          @option_array << @question_option_array
        end
      end
      end
    end
  end

  def create
    @morning_survey = MorningSurvey.create morning_params
    # @question_group = QuestionGroup.new(survey_params)
    # @question = @question_group.questions.build
    # @answer = @question.options.build
    if @morning_survey.save
      # format.json { render action: }
      redirect_to page_path
    else
      render :new
    end
  end

end