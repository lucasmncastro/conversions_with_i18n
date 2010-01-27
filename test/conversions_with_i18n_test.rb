require 'test_helper'

class ConversionsWithI18nTest < ActiveSupport::TestCase
  def setup
    @date = Date.today
    @time = Time.now
    I18n.backend.store_translations :'pt-BR', {
      :date => {:formats => {:default => "%d/%m/%Y", :short => "%d de %B", :long => "%d de %B de %Y"}},
      :time => {:formats => {:default => "%d/%m/%Y %H:%M", :short => "%d/%m, %H:%M hs", :long => "%A, %d de %B de %Y, %H:%M hs"}}
    }
  end

  test "Date#to_s should return message with English format when the locale is en" do
    I18n.locale = 'en'
    assert_equal I18n.l(@date), @date.to_s
  end

  test "Date#to_s should return message with Brazilian format when the locale is pt-BR" do
    I18n.locale = 'pt-BR'
    assert_equal I18n.l(@date), @date.to_s
  end

  test "Date#to_s with format should return i18ned message with this format" do
    I18n.locale = 'pt-BR'
    assert_equal I18n.l(@date, :format => :short), @date.to_s(:short)
  end

  test "Time#to_s with format should reurn i18ned message" do
    I18n.locale = 'pt-BR'
    assert_equal I18n.l(@time), @time.to_s
  end
end
