module MembersHelper

  def get_group(member)
    if member.group.present?
      link_to member.group.name, [:admin, member.group]
    else
      "No Group"
    end
  end

  def link_to_member(member)
    link_to "#{member.name} (#{member.initials})", [:admin, member]
  end

  def member_badge(member)
    if member.group.present?
      content_tag(:span, member.initials, class: 'badge', style: "background-color: ##{member.group.color}")
    else
      content_tag(:span, member.initials, class: 'badge badge-default')
    end
  end

  def member_circle(member)
    if member.group.present?
      content_tag(:div, member.initials, class: 'member-circle', style: "background-color: ##{member.group.color}")
    else
      content_tag(:div, member.initials, class: 'member-circle')
    end
  end

end
