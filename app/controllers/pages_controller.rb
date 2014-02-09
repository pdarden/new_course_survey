class PagesController < ApplicationController

  def index

  end

  def new
    @survey = Survey.new
    @survey_questions = get_json
  end

  def create
    @survey = Survey.new survey_params
    if @survey.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def survey_params
    params.require(:survey).permit(:json_input, :json_output)
  end

end
