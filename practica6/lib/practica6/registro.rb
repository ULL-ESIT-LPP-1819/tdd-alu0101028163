
class Registro
  include Comparable
  attr_reader :nombre, :peso, :talla, :edad, :sexo, :cir_cintura, :cir_cadera, :cir_brazo, :pl_tricipital, :pl_bicipital, :pl_subescapular, :pl_suprailiaco, :imc, :factor

  # @param [Registro] recibe como parámetro otra instancia de la clase Registro con la que va a compararse
  # @return [Number] retorna -1,0 o 1.
  def <=>(anOther)
    @imc <=> anOther.imc
  end

  # @param nombre [number] nombre del paciente.
  # @param peso [number] peso del paciente.
  # @param talla [number] altura del paciente en metros.
  # @param edad [number] edad del paciente.
  # @param sexo [number] sexo del paciente, 0 corresponde a hombre y 1 a mujer.
  # @param cir_cintura [Number] circunferencia de la cintura del paciente.
  # @param cir_cadera [Number] circunferencia de la cadera del paciente.
  # @param cir_brazo [Number] circunferencia del brazo del paciente.
  # @param pl_tricipital [Number] longitud del pliege tricipital del pariente.
  # @param pl_bicipital [Number] longitud del pliege bicipital del pariente.
  # @param pl_subescapular [Number] longitud del pliege subescapular del pariente.
  # @param pl_suprailiaco [Number] longitud del pliege suprailiaco del pariente.
  # @return [Paciente_Obeso] retorna una instancia de la clase Registro.
  def initialize(nombre, peso, talla, edad, sexo, cir_cintura = nil, cir_cadera = nil, cir_brazo = nil, pl_tricipital = nil, pl_bicipital = nil, pl_subescapular = nil, pl_suprailiaco = nil, factor= nil)
    @nombre = nombre
    @peso = peso
    @talla = talla
    @edad = edad
    @sexo = sexo
    @cir_cintura = cir_cintura
    @cir_cadera = cir_cadera
    @cir_brazo = cir_brazo
    @pl_tricipital = pl_tricipital
    @pl_bicipital = pl_bicipital
    @pl_subescapular = pl_subescapular
    @pl_suprailiaco = pl_suprailiaco
    @factor = factor
    @imc = self.calcular_imc
  end

  # @return [Number] retorna el índice de masa corporal.
  def calcular_imc
    imc = @peso / (@talla * @talla)
    imc = (imc * 100).round() / 100.0
  end

  # @return [Number] retorna el porcentaje de grasas.
  def calcular_pctj_grasa
    pctj_grasa = (1.2 * self.calcular_imc()) + (0.23 * @edad) - (10.9 * @sexo) - 5.4
    pctj_grasa = (pctj_grasa*100).round() / 100.0
  end

  # @return [Number] retorna el rcc.
  def calcular_rcc
    cir_cintura = calcular_media(@cir_cintura)
    cir_cadera = calcular_media(@cir_cadera)
    rcc = cir_cintura / cir_cadera
    rcc = (rcc * 100).round() / 100.0
  end

  # @return [String] retorna una cadena donde se evalúa el índice de masa corporal.
  def evaluar_imc

    imc = calcular_imc()

    if (imc < 18.5)
      puts "IMG menor que 18.5, según la OMS bajo peso, popularmente asociamos a las personas con este índice como Aceptables."
    elsif (18.5 < imc && imc < 24.9)
      puts "IMC entre 18.5 y 24.5, según la OMS un índice adecuado, popularmente asociamos a las personas con este índice como Aceptables."
    elsif (25.0 < imc && imc < 29.9)
      puts "IMC entre 25.0 y 29.9, según la OMS un índice de sobrepeso, popularmente asociamos a las personas con este índice como con sobrepeso."
    elsif (30.0 < imc && imc < 34.9)
      puts "IMC entre 30.0 y 34.9, según la OMS un índice de Obesidad grado 1, popularmente asociamos a las personas con este índice como obesas."
    elsif (35.0 < imc && imc < 39.9)
      puts "IMC entre 35.0 y 39.9, según la OMS un índice de Obesidad grado 2, popularmente asociamos a las personas con este índice como obesas."
    elsif (imc > 40)
      puts "IMC mayor de 40, según la OMS un índice de Obesidad grado 2, popularmente asociamos a las personas con este índice como obesas."
    end

  end

  # @return [String] retorna una cadena donde se evalúa el rcc.
  def evaluar_rcc

    rcc = calcular_rcc()

    case @sexo
    when 0
      if (0.72 < rcc && rcc < 0.75)
          puts "RCC entre 0.72 y 0.75 conlleva un riesgo bajo para una mujer"
      elsif (0.78 < rcc && rcc  < 0.82)
          puts "RCC entre 0.78 y 0.82 conlleva un riesgo moderado para una mujer"
      elsif (rcc > 0.82)
          puts "RCC mayor que 0.82, conlleva un riesgo alto para una mujer"
      end
    when 1
      if (0.83 < rcc && rcc < 0.88)
        puts "RCC entre 0.83 y 0.88 conlleva un riesgo bajo para un hombre"
      elsif (0.88 < rcc && rcc < 0.95)
        puts "RCC entre 0.88 y 0.95 conlleva un riesgo moderado para un hombre"
      elsif (0.95 < rcc && rcc < 1.01)
        puts "RCC entre 0.95 y 1.01 conlleva un riesgo alto para un hombre"
      elsif (rcc > 1.01)
        puts "RCC mayor de 1.01 conlleva un riesgo muy alto para un hombre"
      end
    end
  end

  # @return [Number] calcula la media de los datos.
  def calcular_media(datos_)

    mean = 0.0
    datos_.each{ |x| mean = mean + x }
    mean /= datos_.length
    mean = ( mean * 100).round() / 100.0

  end

  # @return [String] muestra la información del registro.
  def mostrar_info()

    print("Nombre: ", @nombre)
    puts " "
    print("Peso: ", @peso)
    puts " "
    print("Talla: ", @talla)
    puts " "
    print("Edad: ", @edad)
    puts " "
    print("Sexo: ", @nombre)
    puts " "

    print("Circunferencia de la cintura: ", @cir_cintura)
    puts " "
    puts "Media: %0.2f" %[calcular_media(@cir_cintura)]

    print("Circunferencia de la cadera: ", @cir_cadera)
    puts " "
    puts "Media: %0.2f" %[calcular_media(@cir_cadera)]

    print("Circunferencia del brazo: ", @cir_brazo)
    puts " "
    puts "Media: %0.2f" %[calcular_media(@cir_brazo)]

    print("Pliegue tricipital ", @pl_tricipital)
    puts " "
    puts "Media: %0.2f" %[calcular_media(@pl_tricipital)]

    print("Pliegue bicicipital ", @pl_bicipital)
    puts " "
    puts "Media: %0.2f" %[calcular_media(@pl_bicipital)]

    print("Pliegue subescapular ", @pl_subescapular)
    puts " "
    puts "Media: %0.2f" %[calcular_media(@pl_subescapular)]

    print("Pliegue suprailiaco ", @pl_suprailiaco)
    puts " "
    puts "Media: %0.2f" %[calcular_media(@pl_suprailiaco)]

    evaluar_imc()
    evaluar_rcc()

  end

end
