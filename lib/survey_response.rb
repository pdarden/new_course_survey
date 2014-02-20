module SurveyResponse

  def format_survey_response response
    Hash[response.question.zip(response.answer)]
  end

end