module Aureus
  class Draft
    def initialize
      @hash = {}
    end

    def set(key, *args, &block)
      value = block ? nil : args[0]
      context = (block ? args[0] : args[1]) || {}
      @hash[key] = [] unless @hash.key?(key)
      @hash[key] << { value: value, block: block, context: context }
    end

    def get(key, context={})
      values = @hash[key] or raise "key not found '#{key}'"
      chosen = nil

      values.each do |value|
        if satisfy_context(value[:context], context)
          chosen = value
          break
        end
      end

      raise 'no key matches context' unless chosen

      return chosen[:block].call if chosen[:block]
      chosen[:value]
    end

    def satisfy_context(c1, c2)
      c1.each do |key, value|
        return false unless c2.key(key) && c2[key] == value
      end
      true
    end
  end
end
