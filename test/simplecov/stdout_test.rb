require 'test_helper'

require 'simplecov'
SimpleCov.filters.clear

class Simplecov::StdoutTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Simplecov::Stdout::VERSION
  end

  def test_formatter_with_full_coverage
    result = SimpleCov::Result.from_hash(
      'bin/rails test' => {
        'coverage' => {
          'test/example/a.rb' => [nil, 1, 1, 1]
        },
        'timestamp' => Time.now.to_i
      }
    )

    output = with_captured_stdout do
      SimpleCov::Formatter::Stdout.new.format(result)
    end

    assert_equal '', output
  end

  def test_formatter_with_missing_coverage
    result = SimpleCov::Result.from_hash(
      'bin/rails test' => {
        'coverage' => {
          'test/example/a.rb' => [nil, 1, 1, 1],
          'test/example/b.rb' => [nil, 1, 0, 1]
        },
        'timestamp' => Time.now.to_i
      }
    )

    output = with_captured_stdout do
      SimpleCov::Formatter::Stdout.new.format(result)
    end

    rows = output.lines
      .slice(3..-2)
      .map{|line| line.strip.split('┃').map(&:strip) }

    assert_equal 1, rows.count
    assert_equal ['', 'test/example/b.rb', '2', '3', '66.67%', '3'], rows[0]
  end

  # https://stackoverflow.com/a/22777806
  def with_captured_stdout
    old_stdout = $stdout
    $stdout = StringIO.new('', 'w')
    yield
    $stdout.string
  ensure
    $stdout = old_stdout
  end
end
