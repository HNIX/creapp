module ApplicationHelper
  def model_has_error?(model, attribute)
    model.errors.has_key?(attribute)
  end

  def model_attribute_class(model, attribute)
    model_has_error?(model, attribute) ? 'error' : ''
  end

  def model_attribute_class_array(model, attribute_array)
    attribute_array.each do |attribute|
      return 'error' if model_has_error?(model, attribute)
    end
    ''
  end

  def model_error_message(model, attribute)
    return '' unless model_has_error?(model, attribute)
    messages = model.errors.messages[attribute]
    messages.empty? ? '' : "#{attribute.to_s.humanize} #{messages.to_sentence}."
  end

end
