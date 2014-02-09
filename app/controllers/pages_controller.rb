class PagesController < ApplicationController

  def index

  end

  def new
    @survey_questions = get_json
  end

  def create

  end

end
