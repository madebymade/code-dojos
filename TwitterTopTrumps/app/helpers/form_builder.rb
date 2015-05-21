class FormBuilder < ActionView::Helpers::FormBuilder
  def errors(method, options = {})
    errors = object.errors.full_messages_for(method) || []

    unless errors.empty?
      "<div class=\"field__error\">#{errors.uniq.join(', ')}</div>".html_safe
    end
  end
end
