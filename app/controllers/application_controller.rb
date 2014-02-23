class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # include SurveyResponse

  def get_json
    survey = File.read("survey.json")
    ActiveSupport::JSON.decode(survey)
  end

  def arrify_q questions
    strs = questions.split('", "')
    strs[0].gsub!(/\[/, '')
    strs[-1].gsub!(/\]/, '')
    strs.map! do |str|
      str.gsub(/"/, '')
      str.to_sym
    end
    strs
  end

  def arrify_a answers
    strs = answers.split('", "')
    strs[0].gsub!(/\[/, '')
    strs[-1].gsub!(/\]/, '')
    strs.map! do |str|
      str.gsub(/"/, '')
    end
    strs
  end

  def hash_survey_response title, response
    questions = arrify_q(response.question)
    answers = arrify_a(response.answer)
    questions.unshift("survey title:")
    answers.unshift(title)
    Hash[questions.zip(answers)]
  end

  def json_survey_response results
    obj = results.each do |q,a|
      q.to_sym
    end
    obj.to_json
  end

end
