class AddDefaultToPageTagsCountInTags < ActiveRecord::Migration[7.0]
  def change
    change_column_default :tags, :page_tags_count, 0
  end
end
