class MorningSurveysController < ApplicationController

def new
    # binding.pry
    @number = 1
    @survey_questions = get_json
    @page = MorningSurvey.new
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

  def arrify long_str
    strs = long_str.split('", "')
    p "strs"
    p strs
    p "strs_______"
    strs[0].gsub!(/\[/, '')
    strs[-1].gsub!(/\]/, '')
    strs.map! do |str|
      # str.to_s
      str.gsub(/"/, '')
      # str.gsub(/\]/, '')
      # str.gsub(/\[/, '')
    end
    strs
  end

  def format_survey_response response
    p "response______________"
    p response.question
    p response.answer
    p "response______________"
    questions = arrify(response.question)
    answers = arrify(response.answer)
    Hash[questions.zip(answers)]
  end

  def create
    survey_questions = get_json
    num = survey_questions["questions"].length
    the_answers = []
    num.times do |index|
      the_answers << request.params["#{index}"]
    end
    @morning_survey = MorningSurvey.create morning_params
    @morning_survey.update_attribute(:answer, the_answers.to_s)
    if @morning_survey.save
      poop = format_survey_response @morning_survey
      p "poop"
      p poop
      p "poop"
      # format.json { render action: }
      redirect_to morning_survey_path @morning_survey
    else
      render :new
    end
  end

  def show
    @morning_survey = MorningSurvey.last
  end

   private

  def morning_params
    params.require(:morning_survey).permit(:question, :answer)
  end

end