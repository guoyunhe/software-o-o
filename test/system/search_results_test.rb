require File.expand_path('../../test_helper', __FILE__)

class SearchResultsTest < ActionDispatch::SystemTestCase
  def test_default_searches
    stub_search_random('nvidia', 'openSUSE:Leap:15.0')

    visit '/'
    page.fill_in 'q', with: 'nvidia'
    page.find(:css, 'button#search-button').click

    page.assert_text 'for instructions how to configure your NVIDIA graphics card'
  end

  def test_non_existing_packages
    stub_search_random('paralapapiricoipi', 'openSUSE:Leap:15.0', matches: 0)

    visit '/'
    page.fill_in 'q', with: 'paralapapiricoipi'
    page.find(:css, 'button#search-button').click

    page.assert_text 'No packages found matching your search.'
  end
end
