require 'rails_helper'

RSpec.describe PageSearch do
  subject { PageSearch }

  describe '.search' do
    it 'nil params returns no pages' do
      expect(subject.search(nil)).to eq([])
    end

    it 'empty params returns no pages' do
      expect(subject.search({})).to eq([])
    end

    it 'an empty term is not sent to .by_term' do
      allow(Page).to receive(:by_term)
      PageSearch.search({ term: ''})
    end

    it 'a nil term is not sent to .by_term' do
      allow(Page).to receive(:by_term)
      PageSearch.search({ term:nil })
      expect(Page).to_not have_received(:by_term)
    end

    it 'a valid term is sent to .by_term' do
      allow(Page).to receive(:by_term)
      PageSearch.search({ term: 'foo' })
      expect(Page).to have_received(:by_term).with('foo')
    end

    it 'valid year and month are sent to .by_year_month' do
      allow(Page).to receive(:by_year_month)
      PageSearch.search({ year: 2022, month: 8 })
      expect(Page).to have_received(:by_year_month).with(2022, 8)
    end
  end

  describe '.by_term' do
    let(:page1) { create(:page, content: 'foo') }
    let(:page2) { create(:page, content: 'foo bar') }
    let(:page3) { create(:page, content: 'foo bar baz') }

    before do
      [page1, page2]
    end

    it 'returns pages for the given term' do
      expected = [page1, page2, page3]
      expect(Page.by_term('foo')).to match_array(expected)
    end

    it 'returns pages for multiple terms' do
      expected = [page3]
      expect(Page.by_term('foo baz')).to match_array(expected)
    end
  end
end
