class MemoryKeyValueStore
  def initialize(options = {})
    @value = options
  end

  def get(key_name)
    if key_name.class == String
      @value[key_name]
    else
      raise StandardError.new "access with non-string value not allowed"
    end
  end

  def set(key_name, value)
    @value[key_name] = value
    return "OK"
  end

  def keys(regexp = nil)
    if regexp
      @value.keys.filter{|key_name| key_name.match(regexp)}
    else
      @value.keys
    end
  end
end
