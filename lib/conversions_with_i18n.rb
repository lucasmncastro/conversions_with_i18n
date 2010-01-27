module ConversionsWithI18n
  def self.included(base)
    base.instance_eval do
      alias_method_chain :to_formatted_s, :i18n
      alias_method       :to_s, :to_formatted_s
    end
  end

  def to_formatted_s_with_i18n(format = :default)
    I18n.l self, :format => format
  end
end
