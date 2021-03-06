require 'rails_helper'

describe ExperienceRecorder do
  let(:time_report) { create(:time_report) }

  it '既に同じ名前のタグがある時には新しくタグが作成されないこと' do
    tag = create(:tag, name: 'test')
    tags = { 'tags' => [{ 'text' => 'foo' }, { 'text' => 'test' }]}
    expect {
      TagRecorder.new(time_report).create_links(tags)
    }.to change(Tag, :count).by(1)
  end

  it 'タグとタイムレポートが紐付けされること' do
    tags = { 'tags' => [{ 'text' => 'foo' }, { 'text' => 'test' }]}
    expect {
      TagRecorder.new(time_report).create_links(tags)
    }.to change(time_report.links, :count).by(2)
  end

  it 'タグを減らせること' do
    tags = { 'tags' => [{ 'text' => 'foo' }, { 'text' => 'test' }]}
    TagRecorder.new(time_report).create_links(tags)
    tags = { 'tags' => [{ 'text' => 'foo' }]}
    expect {
      TagRecorder.new(time_report).create_links(tags)
    }.to change(time_report.tags, :count).by(-1)
  end

  it 'どのタイムレポートとも紐付いていないタグは削除されること' do
    tags = { 'tags' => [{ 'text' => 'foo' }, { 'text' => 'test' }]}
    TagRecorder.new(time_report).create_links(tags)
    tags = { 'tags' => [{ 'text' => 'foo' }]}
    expect {
      TagRecorder.new(time_report).create_links(tags)
    }.to change(Tag, :count).by(-1)
  end
end