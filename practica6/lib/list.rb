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

  def pop_front()
    aux = @head
    @head = @head.next
    @head.prev = nil
    aux.prev = nil
    aux.next = nil
    @size -= 1
  end

  def pop_back()
    aux = @tail
    @tail = @tail.prev
    @tail.next = nil
    aux.next = nil
    aux.prev = nil
    @size -= 1
  end

  def [](position)
    aux = @head
      position.times do
        aux = aux.next
      end
    aux
  end

end
