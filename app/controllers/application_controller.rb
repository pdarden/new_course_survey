class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # include SurveyResponse

  def get_json
    survey = File.read("survey.json")
    ActiveSupport::JSON.decode(survey)
  end

  def arrify long_str
      strs = long_str.split('", "')
      strs[0].gsub!(/\[/, '')
      strs[-1].gsub!(/\]/, '')
      strs.map! do |str|
        str.gsub(/"/, '')
      end
      strs
    end

  def format_survey_response title, response
    questions = arrify(response.question)
    answers = arrify(response.answer)
    questions.unshift("survey title:")
    answers.unshift(title)
    Hash[questions.zip(answers)]
  end

end
