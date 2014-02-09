class PagesController < ApplicationController

  def index
    @survey = {blamo: "aslfkj", bah: "bam"}
  end

  def new
    @survey_questions = get_json
    # @question_group = QuestionGroup.new(:survey_title => @survey_questions["survey_title"])
    @morning_survey = MorningSurvey.new#(:survey_title => @survey_questions["survey_title"])
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
    # binding.pry
  end

  def create
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

  def show
    @question_group = QuestionGroup.last
  end

  private

  def survey_params
    params.require(:question_group).permit(:survey_title)
  end

  def question_params
    params.require(:question).permit(:inquiry)
  end

  def option_params
      params.require(:option).permit(:response)
  end

end
