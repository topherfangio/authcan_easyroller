module ApplicationHelper
  def namify(object)
    if object.present? and object.respond_to? :name
      object.send(:name)
    else
      ""
    end
  end
 
  def datify(object, format = :long)
    object.to_s(format) unless object.nil?
  end
 
  def phonify(object)
    if object.respond_to? :gsub
      s = object.gsub(/[^0-9]/, '')
 
      case s.length
        when 11 then "#{s[0..0]} (#{s[1..3]}) #{s[4..6]}-#{s[7..10]}"
        when 10 then "(#{s[0..2]}) #{s[3..5]}-#{s[6..9]}"
        when 7 then "#{s[0..2]}-#{s[3..6]}"
        else s
      end
    else
      object.to_s
    end
  end
 
  def form_descriptor(message = nil)
    raw "<br /><span class='form-descriptor-element'>#{message}</span>"
  end
 
  def link_separator
    raw "&nbsp;|&nbsp;"
  end
end
