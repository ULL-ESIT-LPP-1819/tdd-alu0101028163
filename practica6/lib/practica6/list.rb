class List
include Enumerable
attr_reader :head, :tail, :size

  def initialize()
    @head = nil
    @tail = nil
    @size = 0
  end

  def push_back(etiqueta)

    node = Struct.new(:prev, :next, :value).new(nil,nil,etiqueta)

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

  def push_front(etiqueta)

    node = Struct.new(:prev, :next, :value).new(nil,nil,etiqueta)

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

  def swap(a,b)

    if @size == 2
      a.prev = b
      b.next = a
      @tail = a
      @head = b
    elsif a == @head
      a.next = b.next
      b.prev = nil
      b.next.prev = a
      a.prev = b
      b.next = a
      @head = b
    elsif b == @tail
      a.next = nil
      b.prev = a.prev
      a.prev.next = b
      a.prev = b
      b.next = a
      @tail = a
    else
      a.next = b.next
      b.prev = a.prev
      a.prev.next = b
      b.next.prev = a
      a.prev = b
      b.next = a
    end



    end

  def clasificar_etiquetas
    ordenado = false
    aux_ = @head
    while ordenado != true do
      ordenado = true
      i = 0
      aux = @head
      (@size - 1).times do
        if aux.value.sal > aux.next.value.sal
           self.swap(aux, aux.next)
           ordenado = false
           aux = aux.prev
          end
        aux = aux.next
        end
      end

    end

  def clasificar_imc
    ordenado = false
    aux_ = @head
    while ordenado != true do
      ordenado = true
      i = 0
      aux = @head
      (@size - 1).times do
        if aux.value.registro.imc > aux.next.value.registro.imc
           self.swap(aux, aux.next)
           ordenado = false
           aux = aux.prev
          end
        aux = aux.next
        end
      end
  end

  def to_s
    aux_ = @head
    s = ""
    while aux_ != nil do
      s << aux_.value.to_s
      aux_ = aux_.next
    end
    s
  end

end
