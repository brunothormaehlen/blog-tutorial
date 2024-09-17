require 'rails_helper'

RSpec.describe TagsHelper, type: :helper do
  describe '#tag_links' do
    let(:page) { create(:page, tags_string: 'foo, bar') }
    let(:result) { helper.tag_links(page.tags.ordered) }

    it 'returns a list of tag links' do
      expected = <<~HTML.squish
        <a href="/tags/bar">bar (1)</a>
        <a href="/tags/foo">foo (1)</a>
      HTML
      expect(result).to eq(expected)
    end
  end
end

# require 'rails_helper'

# RSpec.describe TagsHelper, type: :helper do
#   describe '#tag_links' do
#     let(:page) { create(:page, tags_string: 'foo, bar') }
#     let(:result) { helper.tag_links(page.tags.ordered) }

#     it 'returns a list of tag links' do
#       expected = <<~HTML.squish
#         <a href="/tags/bar">bar (1)</a>
#         <a href="/tags/foo">foo (1)</a>
#       HTML
#       expect(result).to eq(expected)
#     end

#     it 'creates both tags' do
#       expect(page.tags.count).to eq(2)
#       expect(page.tags.pluck(:name)).to contain_exactly('foo', 'bar')
#     end

#     it 'generates links for both tags' do
#       expect(result).to include('href="/tags/foo"')
#       expect(result).to include('href="/tags/bar"')
#     end
#   end
# end

require 'rails_helper'

RSpec.describe TagsHelper, type: :helper do
  describe '#tag_links' do
    let(:page) { create(:page, tags_string: 'foo, bar') }
    let(:result) { helper.tag_links(page.tags.ordered) }

    it 'returns a list of tag links' do
      expected = '<a href="/tags/bar">bar (1)</a> <a href="/tags/foo">foo (1)</a>'
      expect(result).to eq(expected)
    end

    it 'creates both tags' do
      expect(page.tags.count).to eq(2)
      expect(page.tags.pluck(:name)).to contain_exactly('foo', 'bar')
    end

    it 'generates links for both tags' do
      expect(result).to include('href="/tags/foo"')
      expect(result).to include('href="/tags/bar"')
    end
  end
end
