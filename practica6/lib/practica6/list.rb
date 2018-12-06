class List
include Enumerable
attr_reader :head, :tail, :size

  # @return [List] retorna una nueva instancia de Lista.
  def initialize()
    @head = nil
    @tail = nil
    @size = 0
  end

  # @return [List] método each implementado para el correcto funcionamiento del módulo Enumerable.
  def each()
    head_aux = @head
    while head_aux != nil do
      yield head_aux.value
      head_aux = head_aux.next
    end
  end

  # @param etiqueta [Etiqueta] Recibe como parámetro una etiqueta que pasará a ser el valor de un nodo construido a posteriori.
  # @return [Number] Retorna el tamaño de la lista tras expandirse esta.
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

  # @param etiqueta [Etiqueta] Recibe como parámetro una etiqueta que pasará a ser el valor de un nodo construido a posteriori.
  # @return [Number] Retorna el tamaño de la lista tras expandirse esta.
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

  # @return [Number] Retorna el tamaño de la lista tras decrementarse esta.
  def pop_front()
    aux = @head
    @head = @head.next
    @head.prev = nil
    aux.prev = nil
    aux.next = nil
    @size -= 1
  end

  # @return [Number] Retorna el tamaño de la lista tras decrementarse esta.
  def pop_back()
    aux = @tail
    @tail = @tail.prev
    @tail.next = nil
    aux.next = nil
    aux.prev = nil
    @size -= 1
  end

  # @param position [Number] recibe como parámetro la posición de la lista a inspeccionar.
  # @return [Struct] retorna un struct que en el que está encapsulado el nodo.
  def [](position)
    aux = @head
      position.times do
        aux = aux.next
      end
    aux
  end

  # @param a [Struct] nodo a intercambiar.
  # @param b [Struct] nodo a intercambiar.
  # @return [Struct]
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

  # @return [Struct]
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

  # @return [Struct]
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

  # @return [String] retorna una cadena con la información de todos los nodos de la lista.
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
