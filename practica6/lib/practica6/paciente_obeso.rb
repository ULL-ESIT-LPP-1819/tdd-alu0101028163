
class Paciente_obeso < Paciente

  attr_reader :cir_cintura, :cir_cadera, :cir_brazo, :pl_tricipital, :pl_bicipital, :pl_subescapular, :pl_suprailiaco, :registro

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
    # @return [Paciente_Obeso] retorna una instancia del Paciente_Obeso.
    def initialize(nombre, peso, talla, edad, sexo, cir_cintura, cir_cadera, cir_brazo, pl_tricipital, pl_bicipital, pl_subescapular, pl_suprailiaco)
      super(nombre, peso, talla, edad, sexo)
      @cir_cintura = cir_cintura
      @cir_cadera = cir_cadera
      @cir_brazo = cir_brazo
      @pl_tricipital = pl_tricipital
      @pl_bicipital = pl_bicipital
      @pl_subescapular = pl_subescapular
      @pl_suprailiaco = pl_suprailiaco
      @registro = Registro.new(nombre, peso, talla, edad, sexo, cir_cintura, cir_cadera, cir_brazo, pl_tricipital, pl_bicipital, pl_subescapular, pl_suprailiaco)
    end

    # @return [String] retorna una cadena con la información del paciente obeso.
    def to_s
      s = "Nombre: #{@nombre}
       Peso: #{@peso}
       Altura: #{@talla}
       Edad: #{@edad}
       "
       if @sexo == 0
         s << "Sexo: Hombre"
       else s << "Sexo: Mujer"
       end

       s << "
       Circunferencia cintura: #{@cir_cintura}
       Circunferencia cadera: #{@cir_cadera}
       Circunferencia brazo: #{@cir_brazo}
       Pliegue tricipital: #{@pl_tricipital}
       Pliegue bicipital: #{@pl_bicipital}
       Pliegue subescapular: #{@pl_subescapular}
       Pliegue suprailiaco: #{@pl_suprailiaco}"

       s
    end

end
