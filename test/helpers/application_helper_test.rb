require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title, "Novvum-Hacks Project"
    assert_equal full_title("Help"), "Help | Novvum-Hacks Project"
  end
end

