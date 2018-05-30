require 'test_helper'
require 'uri'

class BreviTest < ActiveSupport::TestCase
  test 'should not save the record if duplicated original_url' do
    link = Brevi.new original_url: 'http://www.google.com'
    assert_not link.save
  end

  test 'should not save the record if duplicated slug' do
    link = Brevi.new slug: 'slug01'
    assert_not link.save
  end

  test 'should slug generator use only alphanumeric characters' do
    link = Brevi.new
    link.generate_slug
    regex = /[^a-z^0-9]+/i
    assert_no_match regex, link.slug
  end

  test 'should slug generator use 4 to unlimited alphanumeric characters' do
    link = Brevi.new
    link.generate_slug
    assert link.slug.length >= 4
  end

  test 'should original_url contain at least one valid url' do
    link = Brevi.first
    uri = URI.extract(link.original_url, ['http', 'https'])
    assert uri.length == 1
  end
end
