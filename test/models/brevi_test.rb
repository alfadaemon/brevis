require 'test_helper'
require 'uri'

class BreviTest < ActiveSupport::TestCase
  test 'should not save the record if duplicated original_url' do
    link = Brevi.new
    link.original_url = 'UnsecureURL'
    assert_not link.save
  end

  test 'should not save the record if duplicated slug' do
    link = Brevi.new
    link.slug = 'slug01'
    assert_not link.save
  end

  test 'should increment clicks when updating' do
    link = Brevi.first
    count = link.clicks
    link.increment! :clicks
    assert_equal (count+1), link.clicks
  end

  test 'should generate slug with 6 characters before save' do
    link = Brevi.new
    puts link
    length = 0 || link.slug.length
    assert_equal 6, length
  end

  test 'should original_url contain at least one valid url' do
    link = Brevi.new
    uri = URI.extract('www.google.com' || link.original_url, ['http', 'https'])
    assert uri.length == 1
  end
end
