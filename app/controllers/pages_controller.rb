class PagesController < ApplicationController

  def index

  end

  def new
    @survey = Survey.new
    @survey_questions = get_json
  end

  def create
    @question_group = QuestionGroup.new survey_params
    @question = @question_group.questions.build
    @answer = @question.answers.build
    if @question_group.save
      format.json { render action:}
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def survey_params
    params.require(:question_group).permit(:survey_title)
  end

end
