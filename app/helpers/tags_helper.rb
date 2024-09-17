module TagsHelper
  def tag_links(tags)
    tags.map do |tag|
      link_to "#{tag.name} (#{tag.page_tags_count})", tag_path(tag.name)
    end.join(' ')
  end
end

# module TagsHelper
#   def tag_links(tags)
#     tags.map do |tag|
#       link_to "#{tag.name} (#{tag.pages.count})", tag_path(tag.name)
#     end.join(' ').html_safe
#   end
# end


# module TagsHelper
#   def tag_links(tags)
#     links = tags.map do |tag|
#       link = link_to "#{tag.name} (#{tag.pages.count})", tag_path(tag.name)
#       puts "Generated link for #{tag.name}: #{link}"
#       link
#     end
#     result = links.join(' ').html_safe
#     puts "Final tag links: #{result}"
#     result
#   end
# end
