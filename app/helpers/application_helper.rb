module ApplicationHelper

  def alert_classes(flash_name)
    classes = ['alert']
    case flash_name
    when 'notice'
      classes << 'alert-success'
    when 'alert'
      classes << 'alert-warning'
    when 'error'
      classes << 'alert-danger'
    else
      classes << 'alert-info'
    end
    classes
  end

end
