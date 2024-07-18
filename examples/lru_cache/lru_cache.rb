# Node structure for the DLL
class Node
  attr_accessor :prev_node, :next_node, :value
  def initialize(value, prev_node, next_node)
    @value = value
    @next_node = next_node
    @prev_node = prev_node
  end
end

class LRUCache
  attr_accessor :head, :tail, :current_size, :max_size

  def initialize(max_size)
    @head = nil
    @tail = nil
    @current_size = 0
    @max_size = max_size
    @lookup_table = {}
  end
  

  def get(key)
    result = @lookup_table[key]
    return -1 unless result
    #result is at tail then return value as it is recently used item
    return result.value if @tail == result
    if result.prev_node == nil
      @head = result.next_node
      @head.prev_node = nil
    else
      result.prev_node.next_node = result.next_node
      result.next_node.prev_node = result.prev_node
    end
    @tail.next_node = result
    result.next_node = nil
    result.prev_node = @tail
    @tail = result
    result.value
  end
  
  

  def put(key, val)
    @current_size += 1
    # if current size exceeds, remove least recent item (i.e. head)
    if @current_size > @max_size 
      # remove least recent key values pair from lookup table
      @lookup_table.delete(@lookup_table.key(@head))      
      @head = @head.next_node # then change the head of DLL
      @head.prev_node = nil
    end
    new_node = Node.new(val, @tail, nil)
    if @tail == nil # when new node is very first element in the Dll
      @head = new_node
    else
      @tail.next_node = new_node
    end
    @tail = new_node
    @lookup_table[key] = new_node
  end
  
  
end
  
  # Your LRUCache object will be instantiated and called as such:
  # obj = LRUCache.new(capacity)
  # param_1 = obj.get(key)
  # obj.put(key, value)