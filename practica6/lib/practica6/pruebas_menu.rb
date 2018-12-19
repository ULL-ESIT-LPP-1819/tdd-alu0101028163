#require "./list.rb"
#require "./etiqueta.rb"
#require "./registro.rb"

def peso_teorico(talla)
  peso_teorico_ideal = (talla - 150) * 0.75 + 50
end

# Este es el método que tenía inicialmente
def gasto_basal(peso,talla,edad,sexo)
  gasto_energetico_basal = 0
  if sexo == 0 #Es un hombre
     gasto_energetico_basal = (10*peso) + (6.25*talla) - (5*edad) + 5
  else
     gasto_energetico_basal = (10*peso) + (6.25*talla) - (5*edad) - 161
  end
     gasto_energetico_basal
end

def efecto_termogeno(peso,talla,edad,sexo)
  efecto_termogeno = gasto_basal(peso,talla,edad,sexo) * 0.10
end

def gasto_actividad_fisica(peso,talla,edad,sexo,factor)
  gasto_actividad = gasto_basal(peso,talla,edad,sexo) * factor
end

def gasto_energetico_total(peso,talla,edad,sexo,factor)
  gasto_total = gasto_actividad_fisica(peso,talla,edad,sexo,factor) + gasto_basal(peso,talla,edad,sexo) + efecto_termogeno(peso,talla,edad,sexo)
end


def verificar_cantidad(menu, peso,talla,edad,sexo,factor)
  val_ener_menu = menu.collect{ |menu| menu.valor_energetico[0]}
  total_val = val_ener_menu.reduce(:+)
  gasto_total = gasto_energetico_total(peso,talla,edad,sexo,factor)
  margen_error = (total_val * 10) / 100

  return true if gasto_total <= (total_val + margen_error) && gasto_total >= (total_val - margen_error)
  false
end

# FUNCIONES PRÁCTICA 11 --------------------------------------------

# VALOR ENERGÉTICO DEL MENU
def valor_energetico_menu(menu)
  sum = 0
  for etiqueta in menu do
    sum += etiqueta.valor_energetico[0]
  end
  sum = (sum*100).round() / 100.0

end

# VALOR ENERGÉTICO DE UNA VALORACIÓN NUTRICIONAL DE UN INDIVIDUO
def gasto_energetico_total_(persona)
  gasto_total = gasto_actividad_fisica(persona.peso, persona.talla, persona.edad, persona.sexo, persona.factor) + gasto_basal(persona.peso, persona.talla, persona.edad, persona.sexo) + efecto_termogeno(persona.peso, persona.talla, persona.edad, persona.sexo)
  gasto_total = (gasto_total*100).round() / 100.0
end

def swap(arr, a,b)
    temp = arr[a]
    arr[a] = arr[b]
    arr[b] = temp
end

def obtener_array_each(arr_menu, list_val)

  arr_total = []

  arr_menu.each {|menu| arr_total.push(valor_energetico_menu(menu))}
  list_val.each {|nodo| arr_total.push(gasto_energetico_total_(nodo))}

  i = 0
  arr_total.each do
    j = i
    min = arr_total[j]
    min_pos = i
    actual = arr_total[j]

    while (j < arr_total.length) do
      if (arr_total[j] < min)
          min = arr_total[j]
          min_pos = j
      end
      j += 1
    end

    if (min != actual)
       swap(arr_total, min_pos, i)
    end

    i += 1
    end

    arr_total

end


def obtener_array_for(arr_menu, list_val)
  arr_total = []

  # Insertamos en el array el contenido del valor energético de cada menú.
  for i in arr_menu do
    val_energetico = valor_energetico_menu(i)
    arr_total.push(val_energetico)
  end

  # Insertamos en el array el contenido del gasto energético total de cada individuo.
  for i in list_val do
    arr_total.push(gasto_energetico_total_(i))
  end

  i = 0
  for element in arr_total do

    j = i
    min = arr_total[j]
    min_pos = i
    actual = arr_total[j]

    while (j < arr_total.length) do
      if (arr_total[j] < min)
          min = arr_total[j]
          min_pos = j
      end
      j += 1
    end

    if (min != actual)
       swap(arr_total, min_pos, i)
    end

  i += 1
  end

  arr_total

end



=begin
registro1 = Registro.new("Adrian", 80, 168, 20, 0, 132.3 , 122.3, 140.3 , 12.3 , 15.2, 11.4, 10.5,0.12)
registro2 = Registro.new("Gamma", 120, 190, 32, 0, 132.3 , 122.3, 140.3 , 12.3 , 15.2, 11.4, 10.5, 0.0)
registro3 = Registro.new("Beta", 60, 156, 45, 1, 132.3 , 122.3, 140.3 , 12.3 , 15.2, 11.4, 10.5, 0.12)
registro4 = Registro.new("Alpha", 76, 175, 18, 0, 132.3 , 122.3, 140.3 , 12.3 , 15.2, 11.4, 10.5, 0.27)
registro5 = Registro.new("Umma", 245, 180, 56, 1, 132.3 , 122.3, 140.3 , 12.3 , 15.2, 11.4, 10.5, 0.27)
registro6 = Registro.new("Pepe", 120, 198, 45, 0, 132.3 , 122.3, 140.3 , 12.3 , 15.2, 11.4, 10.5, 0.54)
registro7 = Registro.new("Jose", 80, 170, 56, 0, 132.3 , 122.3, 140.3 , 12.3 , 15.2, 11.4, 10.5, 0.0)
registro8 = Registro.new("Juan", 60, 170, 25, 0, 132.3 , 122.3, 140.3 , 12.3 , 15.2, 11.4, 10.5, 0.12)
registro9 = Registro.new("Francisco", 76, 175, 60, 0, 132.3 , 122.3, 140.3 , 12.3 , 15.2, 11.4, 10.5, 0.12)
registro10 = Registro.new("Mac", 100, 180, 28, 0, 132.3 , 122.3, 140.3 , 12.3 , 15.2, 11.4, 10.5, 0.27)


etiqueta1 = Etiqueta.new([120.24, 572.76], [17.3,10,12], [41.2,4.15,5.12], 3.3 , 2.4, 1.2, 0, false, 0, 0)
etiqueta2 = Etiqueta.new([1000, 572.76], [17.3,10,12], [41.2,4.15,5.12], 3.3 , 2.4, 1.2, 0, false, 0, 0)
etiqueta3 = Etiqueta.new([1023.24, 572.76], [17.3,10,12], [41.2,4.15,5.12], 3.3 , 2.4, 1.2, 0, false, 0, 0)
etiqueta4 = Etiqueta.new([224.4, 572.76], [17.3,10,12], [41.2,4.15,5.12], 3.3 , 2.4, 1.2, 0, false, 0, 0)
etiqueta5 = Etiqueta.new([523.2, 572.76], [17.3,10,12], [41.2,4.15,5.12], 3.3 , 2.4, 1.2, 0, false, 0, 0)
etiqueta6 = Etiqueta.new([670.53, 572.76], [17.3,10,12], [41.2,4.15,5.12], 3.3 , 2.4, 1.2, 0, false, 0, 0)

menu1 = [etiqueta1,etiqueta2,etiqueta3] # 2143.48 kcal
menu2 = [etiqueta1,etiqueta2,etiqueta5] # 1643.44 kcal
menu3 = [etiqueta2,etiqueta3,etiqueta4,etiqueta6] # 2918.17
menu4 = [etiqueta1,etiqueta3,etiqueta6]
menu5 = [etiqueta4,etiqueta2,etiqueta5,etiqueta1]
menu6 = [etiqueta4,etiqueta3,etiqueta6]
menu7 = [etiqueta2,etiqueta1,etiqueta5,etiqueta3]
menu8 = [etiqueta4,etiqueta2,etiqueta5,etiqueta1,etiqueta3]
menu9 = [etiqueta2,etiqueta1]
menu10 = [etiqueta4,etiqueta6,etiqueta5,etiqueta3]

arr_menu = [menu1,menu2,menu3,menu4,menu5,menu6,menu7,menu8,menu9,menu10]
lista_val = List.new()
lista_val.push_back(registro1)
lista_val.push_back(registro2)
lista_val.push_back(registro3)
lista_val.push_back(registro4)
lista_val.push_back(registro5)
lista_val.push_back(registro6)
lista_val.push_back(registro7)
lista_val.push_back(registro8)
lista_val.push_back(registro9)
lista_val.push_back(registro10)


total_arr = obtener_array_each(arr_menu, lista_val)
puts total_arr
=end
