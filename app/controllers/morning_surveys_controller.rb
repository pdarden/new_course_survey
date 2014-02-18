class MorningSurveysController < ApplicationController

def new
    # binding.pry
    @number = 1
    @survey_questions = get_json
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
    if @morning_survey.save
      # format.json { render action: }
      redirect_to morning_survey_path @morning_survey
    else
      render :new
    end
  end

  def show
    @morning_survey = MorningSurvey.last
    p @morning_survey
  end

   private

  def morning_params
    params.require(:morning_survey).permit(:question, :answer)
  end

end