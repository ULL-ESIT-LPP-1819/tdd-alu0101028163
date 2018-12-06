class Etiqueta
  include Comparable
  attr_reader :valor_energetico, :grasas , :hidratos_carbono, :fibra_alimentaria, :proteinas, :sal, :vitamina, :porciones, :cantidad_porciones, :tamanio_porciones

  def <=>(etiqueto)
    @valor_energetico <=> etiqueto.valor_energetico
  end

  # @param valor_energetico [Array] expresado en kJ y en kCal
  # @param grasas [Array] donde tenemos las grasas saturadas, monoinsaturadas y poliinsaturadas.
  # @param hidratos_carbono [Array] donde están contenidos azúcares, polialcoles y el almidón.
  # @param fibra_alimentaria [Number]
  # @param proteinas [Number]
  # @param sal [Number]
  # @param vitamina [Number]
  # @param porciones [Bool] indica si el producto viene o no en porciones
  # @param cantidad_porciones [Number]
  # @param tamanio_porciones [Number]

  def initialize(valor_energetico, grasas, hidratos_carbono, fibra_alimentaria, proteinas, sal, vitamina, porciones , cantidad_porciones, tamanio_porciones)
    @valor_energetico = valor_energetico
    @grasas = grasas
    @hidratos_carbono = hidratos_carbono
    @fibra_alimentaria = fibra_alimentaria
    @proteinas = proteinas
    @sal = sal
    @vitamina = vitamina
    @porciones = porciones
    @cantidad_porciones = cantidad_porciones
    @tamanio_porciones = tamanio_porciones
  end

  # @return [Number] retorna la suma de las grasas.
  def total_grasas()
    sum = 0
    @grasas.each { |a| sum+= a }
    sum
  end

  # @return [Number] retorna la suma de los hidratos de carbono.
  def total_hidratos()
    sum = 0
    @hidratos_carbono.each { |a| sum+= a}
    sum
  end

  # @return [Number] retorna la energía que aportan las grasas saturadas.
  def energia_g_saturadas()
    grasas = @grasas
    energia_total = []
    energia_total.push((grasas[0] * 37).round(2))
    energia_total.push((grasas[0] * 9).round(2))
    energia_total
  end

  # @return [Number] retorna la energía que aportan las grasas monoinsaturadas.
  def energia_g_monoinsaturadas()
    grasas = @grasas
    energia_total = []
    energia_total.push((grasas[1] * 37).round(2))
    energia_total.push((grasas[1] * 9).round(2))
    energia_total
  end

  # @return [Number] retorna la energía que aportan las grasas poliinsaturadas.
  def energia_g_polinsaturadas()
    grasas = @grasas
    energia_total = []
    energia_total.push((grasas[2] * 37).round(2))
    energia_total.push((grasas[2] * 9).round(2))
    energia_total
  end

  # @return [Number] retorna la energía que aportan los azúcares.
  def energia_azucares()
    hidratos = @hidratos_carbono
    energia_total = []
    energia_total.push((hidratos[0] * 17).round(2))
    energia_total.push((hidratos[0] * 4).round(2))
    energia_total
  end

  # @return [Number] retorna la energía que aportan los polialcoles.
  def energia_polialcoles()
    hidratos = @hidratos_carbono
    energia_total = []
    energia_total.push((hidratos[1] * 10).round(2))
    energia_total.push((hidratos[1] * 2.5).round(2))
    energia_total
  end

  # @return [Number] retorna la energía que aporta el almidón.
  def energia_almidon()
    hidratos = @hidratos_carbono
    energia_total = []
    energia_total.push((hidratos[2] * 17).round(2))
    energia_total.push((hidratos[2] * 4).round(2))
    energia_total
  end

  # @return [Number] retorna la energía que aporta la fibra.
  def energia_fibra()
    fibra_alimentaria = @fibra_alimentaria
    energia_total = []
    energia_total.push((fibra_alimentaria * 8).round(2))
    energia_total.push((fibra_alimentaria * 2).round(2))
    energia_total
  end

  # @return [Number] retorna la energía que aportan las proteínas.
  def energia_proteinas()
    proteinas = @proteinas
    energia_total = []
    energia_total.push((proteinas * 17).round(2))
    energia_total.push((proteinas * 4).round(2))
    energia_total
  end

  # @return [Number] retorna la energía que aporta la sal.
  def energia_sal()
    sal = @sal
    energia_total = []
    energia_total.push((sal * 25).round(2))
    energia_total.push((sal * 6).round(2))
    energia_total
  end

  # @return [Number] retorna el valor energético total.
  def valor_energetico_total()
    kj = []
    sum = 0
    sum += self.energia_g_saturadas()[0]
    sum += self.energia_g_monoinsaturadas()[0]
    sum += self.energia_g_polinsaturadas()[0]
    sum += self.energia_azucares()[0]
    sum += self.energia_polialcoles()[0]
    sum += self.energia_almidon()[0]
    sum += self.energia_fibra()[0]
    sum += self.energia_proteinas()[0]
    sum += self.energia_sal()[0]
    kj.push(sum.round(2))
    sum = 0
    sum += self.energia_g_saturadas()[1]
    sum += self.energia_g_monoinsaturadas()[1]
    sum += self.energia_g_polinsaturadas()[1]
    sum += self.energia_azucares()[1]
    sum += self.energia_polialcoles()[1]
    sum += self.energia_almidon()[1]
    sum += self.energia_fibra()[1]
    sum += self.energia_proteinas()[1]
    sum += self.energia_sal()[1]
    kj.push(sum.round(2))
    kj
  end

  # @return [String] retorna una cadena con la información de la etiqueta.
  def to_s
    s = "Valor energético por 100g o 100ml de producto .... #{@valor_energetico[0]} kcal / #{@valor_energetico[1]} kj
    Grasas ........ #{total_grasas} gr
    de las cuales
      saturadas .......... #{@grasas[0]} gr
      monoinsaturadas .... #{@grasas[1]} gr
      polinsaturadas ..... #{@grasas[2]} gr
    Hidratos ............. #{total_hidratos} gr
    de los cuales
      azucares ........... #{@hidratos_carbono[0]} gr
      polialcoles ........ #{@hidratos_carbono[1]} gr
      almidon ............ #{@hidratos_carbono[2]} gr
    Fibra alimentaria .... #{@fibra_alimentaria} gr
    Proteínas ............ #{@proteinas} gr
    Sal .................. #{@sal} gr"

    if @porciones == true
     s << "
    Cantidad porciones ... #{@cantidad_porciones} uds
    Tamaño porciones ..... #{@tamanio_porciones} gr"
    end

    s << "
    "

  end





end


etiqueta_ = Etiqueta.new([2380.24, 572.76], [17.3,10,12], [41.2,4.15,5.12], 3.3 , 2.4, 1.2, 0, true, 1, 25)
puts etiqueta_.to_s
