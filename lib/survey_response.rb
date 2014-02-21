module SurveyResponse

  class SurveyResponse

    def self.arrify long_str
      strs = long_str.split('", "')
      strs[0].gsub!(/\[/, '')
      strs[-1].gsub!(/\]/, '')
      strs.map! do |str|
        str.gsub(/"/, '')
      end
      strs
    end

    def self.format_survey_response response
      questions = arrify(response.question)
      answers = arrify(response.answer)
      Hash[questions.zip(answers)]
    end

  end

end