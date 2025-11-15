#Generar una dieta a partir de los siguientes datos:
#a) Peso del usuario
#b) Estatura del usuario 
#c) Actividad (activa, moderada, sedentaria)
#d) Podriamos poner un apartado de alergias 
#e) sexo (vi que las calorias no son iguales para hombres y mujeres)


#Primero hacemos varios data.frame que tenga todos los alimentos de un tipo (proteinas, lipidos, carbohidratos) para después hacer 
#la función que va a recolectar los datos de estos data.frame
proteinas_df <- data.frame(
  alimento = c("pechuga de pollo", "carne de res", "huevo", "salmon", "tofu", "lomo de cerdo", "pavo", "atun"),
  calorias_por_100g = c(165, 250, 155, 208, 76, 242, 189, 184),
  proteinas_en_100g = c(31, 26, 13, 20, 8, 27, 29, 29),
  alergenos = c("ninguno", "ninguno", "ninguno", "ninguno", "ninguno", "ninguno", "ninguno", "ninguno")
)

carbohidratos_df <- data.frame(
  alimento = c("arroz", "avena", "pasta integral", "pan", "quinoa cocida", "papa", "camote", "platano"),
  calorias_por_100g = c(130, 360, 131, 265, 120, 77, 86, 89),
  carbohidratos_en_100g = c(28, 64, 25, 50, 21, 17, 20, 23),
  alergenos = c("ninguno", "ninguno", "gluten", "gluten", "ninguno", "ninguno", "ninguno", "ninguno")
)

lipidos_df <- data.frame(
  alimento = c("aguacate", "aceite_oliva", "nueces", "almendras", "crema_cacahuate", "semillas_girasol"),
  calorias_por_100g = c(160, 884, 654, 576, 588, 584),
  grasas_por_100g = c(15, 100, 65, 50, 50, 51),
  alergenos = c("ninguno", "ninguno", "frutos_secos", "frutos_secos", "frutos_secos", "ninguno")
)

lacteos_df <- data.frame(
  alimento = c("leche lala", "yogurt natural", "queso panela", "requeson"),
  calorias_por_100g = c(44, 63, 274, 120),
  proteinas_por_100g = c(5, 10, 18, 11),
  alergenos = c("lacteos", "lacteos", "lacteos", "lacteos")
)

frutas_df <- data.frame(
  alimento = c("manzana", "platano", "naranja", "fresa", "uva", "melon", 
               "sandia", "piña", "mango", "kiwi", "pera", "durazno",
               "ciruela", "cereza", "arandanos", "frambuesa", "zarzamora"),
  calorias_por_100g = c(52, 89, 47, 32, 69, 34, 30, 50, 60, 61, 57, 39, 
                        46, 50, 57, 52, 43),
  carbohidratos_por_100g = c(14, 23, 12, 8, 18, 8, 8, 13, 15, 15, 15, 10,
                             11, 12, 14, 12, 10),
  alergenos = c("ninguno", "ninguno", "ninguno", "ninguno", "ninguno", "ninguno",
                "ninguno", "ninguno", "ninguno", "ninguno", "ninguno", "ninguno",
                "ninguno", "ninguno", "ninguno", "ninguno", "ninguno")
)

verduras_df <- data.frame(
  alimento = c("brocoli", "espinaca", "zanahoria", "tomate", "pepino", 
               "lechuga", "coliflor", "pimiento", "calabaza", "berenjena", 
               "apio", "champinones", "alcachofa","esparrago", "col_bruselas"),
  calorias_por_100g = c(34, 23, 41, 18, 15, 15, 25, 26, 26, 25, 
                        16, 22, 47, 20, 43),
  carbohidratos_por_100g = c(7, 4, 10, 4, 3, 3, 5, 6, 7, 6, 
                             3, 3, 11, 4, 9),
  proteinas_por_100g = c(2.8, 2.9, 0.9, 0.9, 0.7, 1.4, 2.0, 1.0, 1.0, 1.0,
                         0.7, 3.1, 3.3, 2.2, 3.4),
  alergenos = c("ninguno", "ninguno", "ninguno", "ninguno", "ninguno", "ninguno",
                "ninguno", "ninguno", "ninguno", "ninguno", "ninguno", "ninguno", "ninguno", "ninguno", "ninguno")
)
#lo valores nutrimentales (aproximaciones) se obtuvieron de busquedas a través de internet, estos valores pueden cambiar según la pagina web de donde saques los datos

#Tiene que calcular: calorias y cantidad de proteina

dieta <- function(){
  #PREGUNTAR DATOS AL USUARIO
  edad<- readline(prompt = "Bienvenido al creador de dietas, Qué edad tiene?")
  edad<-as.numeric(edad)
  sexo<- readline(prompt = "¿Cual es su sexo? (Responda en minusculas: femenino o masculino)")
  peso<- as.numeric(readline(prompt = "Escriba su peso en kilogramos. (Ejemplo: 89)"))
  altura<- as.numeric(readline(prompt = "Escriba su altura en centimetros. (Ejemplo: 156)"))
  actividad<- readline(prompt = "¿Considera que tan activo eres?. (Favor de responder en minusculas y 
                       dentro de estas cinco opciones: poco o ningún ejercicio, ejercicio ligero (1-3 días), ejercicio moderado (3-5 días), 
                       ejercicio fuerte (6-7 días), ejercicio muy fuerte (2 veces por dia)")
alergias<- readline(prompt = "Tiene alergia a alguno de estos grupos alimentarios? (lacteos, gluten, frutos secos). 
                      Si usted tiene alergia a alguno de estos grupos, coloquelo en minusculas (gluten) de lo contrario, coloque (ninguna)")
cambio_peso<-readline(prompt="Quieres subir de peso, bajar de peso, o mantenerlo? (contesta con minusculas, escogiendo estas 3 opciones: subir, bajar, mantener)")
  #CALCULAR LAS CALORIAS QUE DEBE COMER
  ##hacemos la formula para sacar las calorias que debes de consumir según el peso, la altura, la edad y la actividad fisica
  #los valores obtenido de esta fórmula se le denomina "tasa metabolica basal"
  #Las formulas fueron sacadas de la plataforma del Estado peruano
  if(sexo=="masculino" & actividad== "poco o ningún ejercicio"){hombres_TMB<- (10*peso)+(6.25*altura)-(5*edad)+5; calorias<- hombres_TMB*1.2
  }else if(sexo== "masculino" & actividad== "ejercicio ligero"){hombres_TMB<- (10*peso)+(6.25*altura)-(5*edad)+5; calorias<- hombres_TMB*1.375
  }else if(sexo=="masculino" & actividad== "ejercicio moderado"){hombres_TMB<- (10*peso)+(6.25*altura)-(5*edad)+5; calorias<- hombres_TMB*1.55
  }else if(sexo=="masculino" & actividad== "ejercicio fuerte"){hombres_TMB<- (10*peso)+(6.25*altura)-(5*edad)+5; calorias<- hombres_TMB*1.725
  }else if(sexo=="masculino" & actividad== "ejercicio muy fuerte"){hombres_TMB<- (10*peso)+(6.25*altura)-(5*edad)+5; calorias<- hombres_TMB*1.9
  }else if(sexo=="femenino" & actividad== "poco o ningún ejercicio"){mujeres_TMB<- (10*peso)+(6.25*altura)-(5*edad)-161; calorias<-mujeres_TMB*1.2 
  }else if(sexo=="femenino" & actividad== "ejercicio ligero"){mujeres_TMB<- (10*peso)+(6.25*altura)-(5*edad)-161; calorias<-mujeres_TMB*1.375
  }else if(sexo=="femenino" & actividad== "ejercicio moderado"){mujeres_TMB<- (10*peso)+(6.25*altura)-(5*edad)-161; calorias<-mujeres_TMB*1.55
  }else if(sexo=="femenino" & actividad== "ejercicio fuerte"){mujeres_TMB<- (10*peso)+(6.25*altura)-(5*edad)-161; calorias<-mujeres_TMB*1.725
  }else if(sexo=="femenino" & actividad== "ejercicio muy fuerte"){mujeres_TMB<- (10*peso)+(6.25*altura)-(5*edad)-161; calorias<-mujeres_TMB*1.9
  }else{print("corriga su respuesta")
  }

##Después de esto hay que sacar las calorías que debe consumir la persona ajustandolo a si quiere bajar o subir de peso
##valores de multiplicación obtenidos de la página web "fit generation"
if(cambio_peso=="bajar"){calorias_ajustado<-calorias*0.8
}else if(cambio_peso=="subir"){calorias_ajustado<-calorias*1.15
}else{calorias_ajustado<-calorias
}
###Después de eso hay que sacar las proporciones de carbohidratos, proteinas y lipidos que debe tener su dieta
#las cantidades se sacan orque a partir de las calorias totales aproximadamente 50% deben provenir de carbohidratos, 30% de lípidos, 20% de proteínas
#luego se dividen para sacar la cantidad en gramos
cantidad_carbohidratos<- (calorias_ajustado*0.5)/4
cantidad_proteínas<- calorias_ajustado*0.2/4
cantidad_lípidos<-calorias_ajustado*0.3/9


  
} 

dieta