class List

attr_reader :head, :tail, :size

def initialize()
  @head = nil
  @tail = nil
  @size = 0
end

def push_back(node)
  aux = @tail
  @tail = node
  node.prev = aux
  @size += 1
end

def push_front(node)
  aux = @head
  @head = node
  node.next = aux
  @size += 1
end


end
