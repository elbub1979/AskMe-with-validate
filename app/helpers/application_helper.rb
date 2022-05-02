module ApplicationHelper
  def inclination(count, one, few, many)
    return many if (count % 100).between?(11, 14)

    case count % 10
    when 1 then one
    when 2..4 then few
    else
      many
    end
  end

  def navbar_color
    current_user&.navbar_color || '#370617'
  end
end
