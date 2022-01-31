# frozen_string_literal: true

module ApplicationHelper
  def list_tag(arr)
    tag.ol do
      safe_join(arr.map { |el| raw tag.li(el) })  
    end
  end
end
