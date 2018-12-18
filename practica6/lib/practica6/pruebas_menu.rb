 #require './etiqueta.rb'
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

def gasto_energetico_total_(persona)
  gasto_total = gasto_actividad_fisica(persona.peso, persona.talla, persona.edad, persona.sexo, persona.factor) + gasto_basal(persona.peso, persona.talla, persona.edad, persona.sexo) + efecto_termogeno(persona.peso, persona.talla, persona.edad, persona.sexo)
end

def valor_energetico_menu(menu)
  sum = 0
  for etiqueta in menu do
    sum += etiqueta.valor_energetico[0]
  end
  sum
end

def verificar_cantidad(menu, peso,talla,edad,sexo,factor)
  val_ener_menu = menu.collect{ |menu| menu.valor_energetico[0]}
  total_val = val_ener_menu.reduce(:+)
  gasto_total = gasto_energetico_total(peso,talla,edad,sexo,factor)
  margen_error = (total_val * 10) / 100

  return true if gasto_total <= (total_val + margen_error) && gasto_total >= (total_val - margen_error)
  false
end

def obtener_array(arr_menu, list_val)
  arr_total = []

  for i in arr_menu do
    arr_total.push(valor_energetico_menu(arr_menu[i]))
  end

  for i in list_val do
    arr_total.push(gasto_energetico_total_(lista_val[i]))
  end


end
