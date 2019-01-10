class Menu
  attr_reader :name, :titulo, :ingesta, :desayuno, :almuerzo, :cena, :v_energetico_total
  def initialize(name, &block)

  @name = name
  @titulo = ""
  @ingesta = [30,35]
  @desayuno = []
  @almuerzo = []
  @cena = []
  @v_energetico_total = 0


    if block_given?
      if block.arity == 1
        yield self
      else
       instance_eval(&block)
      end
    end


  end

  def to_s

    output = "#{@name}\t\t\t\t"
    output << "Composición Nutricional"
    output << "\n#{'=' * @name.size * 12}\n"
    output << "#{' '  * 32 }"
    output << "grasas\tcarbohidratos\tproteinas fibra   sal   azucares   valor energetico\n\n"
    output << "Desayuno\n"
    output << "#{@desayuno.join}\n"
    output << "Almuerzo\n"
    output << "#{@almuerzo.join}\n"
    output << "Cena\n"
    output << "#{@cena.join}\n"
    output << "Valor Energetico Total: " << "#{@v_energetico_total}"

  end

  def titulo(titulo)
    @titulo = titulo
  end

  # def ingesta(options={})
  #   ingesta << "(#{options[:min]})" if options[:min]
  #   ingesta << "(#{options[:max]})" if optionsþ[:max]
  #   @ingesta << ingesta
  # end

  def ingesta(options={})
      @ingesta[0] = options[:min]
      @ingesta[1] = options[:max]
  end

  def calcular_valor_energetico(ingredientes)
    valor_energetico = 0
    valor_energetico += ingredientes[:grasas] * 9
    valor_energetico += ingredientes[:carbohidratos] * 4
    valor_energetico += ingredientes[:azucares] * 4
    valor_energetico += ingredientes[:fibra] * 2
    valor_energetico += ingredientes[:proteinas] * 4
    valor_energetico += ingredientes[:sal] * 6
  end

  def desayuno(options={})
    hash = options
    desayuno=""
    desayuno << "\"#{options[:descripcion]}\"" if options[:descripcion]
    desayuno << "#{' ' * ( 32 - options[:descripcion].size ) }"
    # desayuno << "#{options[:porcion]}" if options[:porcion]
    # desayuno << "#{options[:gramos]}" if options[:gramos]
    if options[:grasas]
    desayuno << "#{options[:grasas]}".ljust(6)
    else
      desayuno << "".ljust(6)
      hash[:grasas] = 0
    end

    if options[:carbohidratos]
       desayuno << "#{options[:carbohidratos]}".ljust(16)
    else
       desayuno << "".ljust(16)
       hash[:carbohidratos] = 0
    end

    if options[:proteinas]
    desayuno << "#{options[:proteinas]}".ljust(11)
    else
      desayuno << "".ljust(11)
      hash[:proteinas] = 0
    end

    if options[:fibra]
    desayuno << "#{options[:fibra]}".ljust(7)
    else
      desayuno << "".ljust(7)
      hash[:fibra] = 0
    end

    if options[:sal]
    desayuno << "#{options[:sal]}".ljust(8)
    else
      desayuno << "".ljust(8)
      hash[:sal] = 0
    end

    if options[:azucares]
      desayuno << "#{options[:azucares]}".ljust(12)
      else
        desayuno << "".ljust(12)
        hash[:azucares] = 0
      end

    valor_energetico = calcular_valor_energetico(hash)
    @v_energetico_total += valor_energetico
    desayuno << "#{valor_energetico.round(2)}"
    desayuno << "\n"

    @desayuno << desayuno

  end

  def almuerzo(options={})
    hash = options
    almuerzo=""
    almuerzo << "\"#{options[:descripcion]}\"" if options[:descripcion]
    almuerzo << "#{' ' * ( 32 - options[:descripcion].size ) }"
    # almuerzo << "#{options[:porcion]}" if options[:porcion]
    # almuerzo << "#{options[:gramos]}" if options[:gramos]
    if options[:grasas]
    almuerzo << "#{options[:grasas]}".ljust(6)
    else
      almuerzo << "".ljust(6)
      hash[:grasas] = 0
    end

    if options[:carbohidratos]
       almuerzo << "#{options[:carbohidratos]}".ljust(16)
    else
       almuerzo << "".ljust(16)
       hash[:carbohidratos] = 0
    end

    if options[:proteinas]
    almuerzo << "#{options[:proteinas]}".ljust(11)
    else
      almuerzo << "".ljust(11)
      hash[:proteinas] = 0
    end

    if options[:fibra]
    almuerzo << "#{options[:fibra]}".ljust(7)
    else
      almuerzo << "".ljust(7)
      hash[:fibra] = 0
    end

    if options[:sal]
    almuerzo << "#{options[:sal]}".ljust(8)
    else
      almuerzo << "".ljust(8)
      hash[:sal] = 0
    end

    if options[:azucares]
      almuerzo << "#{options[:azucares]}".ljust(12)
      else
        almuerzo << "".ljust(12)
        hash[:azucares] = 0
      end

    valor_energetico = calcular_valor_energetico(hash)
    @v_energetico_total += valor_energetico
    almuerzo << "#{valor_energetico.round(2)}"
    almuerzo << "\n"

    @almuerzo << almuerzo
  end

  def cena(options={})
    hash = options
    cena=""
    cena << "\"#{options[:descripcion]}\"" if options[:descripcion]
    cena << "#{' ' * ( 32 - options[:descripcion].size ) }"
    # cena << "#{options[:porcion]}" if options[:porcion]
    # cena << "#{options[:gramos]}" if options[:gramos]
    if options[:grasas]
    cena << "#{options[:grasas]}".ljust(6)
    else
      cena << "".ljust(6)
      hash[:grasas] = 0
    end

    if options[:carbohidratos]
       cena << "#{options[:carbohidratos]}".ljust(16)
    else
       cena << "".ljust(16)
       hash[:carbohidratos] = 0
    end

    if options[:proteinas]
    cena << "#{options[:proteinas]}".ljust(11)
    else
      cena << "".ljust(11)
      hash[:proteinas] = 0
    end

    if options[:fibra]
    cena << "#{options[:fibra]}".ljust(7)
    else
      cena << "".ljust(7)
      hash[:fibra] = 0
    end

    if options[:sal]
    cena << "#{options[:sal]}".ljust(8)
    else
      cena << "".ljust(8)
      hash[:sal] = 0
    end

    if options[:azucares]
      cena << "#{options[:azucares]}".ljust(12)
      else
        cena << "".ljust(12)
        hash[:azucares] = 0
      end

    valor_energetico = calcular_valor_energetico(hash)
    @v_energetico_total += valor_energetico
    cena << "#{valor_energetico.round(2)}"
    cena << "\n"

    @cena << cena
  end


end


# menu = Menu.new("Lunes") do
#   titulo "Bajo en calorias"
#   ingesta :min => 30, :max => 35
# end
