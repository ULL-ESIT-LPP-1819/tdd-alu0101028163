class List

attr_reader :head, :tail, :size

  def initialize()
    @head = nil
    @tail = nil
    @size = 0
  end

  def push_back(node)

    if @size == 0
        @tail = node
        @head = node
    else
      aux = @tail
      @tail = node
      @tail.prev = aux
      aux.next = tail
    end

    @size += 1

  end

  def push_front(node)

    if @size == 0
        @tail = node
        @head = node
    else
      aux = @head
      @head = node
      @head.next = aux
      aux.prev = @head
    end

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
