require 'rails_helper'

RSpec.describe Post do
  describe 'has presence of' do
    it 'title' do
      expect(build(:post, title: nil)).to have(1).errors_on(:title)
    end

    it 'content' do
      expect(build(:post, content: nil)).to have(1).errors_on(:content)
    end
  end

  describe 'has unique' do
    it 'title' do
      create(:post, title: 'sometitle')
      expect(build(:post, title: 'sometitle')).to have(1).errors_on(:title)
    end
  end
end
