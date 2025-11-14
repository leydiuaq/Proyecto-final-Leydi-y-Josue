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

#lo valores nutrimentales (aproximaciones) se obtuvieron de busquedas a través de internet, estos valores pueden cambiar según la pagina web de donde saques los datos

#Tiene que calcular: calorias y cantidad de proteina

dieta <- function(){
  #PREGUNTAR DATOS AL USUARIO
  edad<- readline(prompt = "Bienvenido al creador de dietas, usted es mayor de 18 años? (Responda si o no en minusculas)")
  sexo<- readline(prompt = "¿Cual es su sexo? (Responda en minusculas: femenino o masculino)")
  peso<- as.numeric(readline(prompt = "Escriba su peso en kilogramos. (Ejemplo: 89)"))
  altura<- as.numeric(readline(prompt = "Escriba su altura en centimetros. (Ejemplo: 156)"))
  actividad<- readline(prompt = "¿Considera que tiene un estilo de vida activo o sedentario?. (Favor de responder en minusculas. Ejemplo: sedentario)")
  alergias<- readline(prompt = "Tiene alergia a alguno de estos grupos alimentarios? (lacteos, gluten, frutos secos). 
                      Si usted tiene alergia a alguno de estos grupos, coloquelo en minusculas (gluten) de lo contrario, coloque (ninguna)")
  
  #CALCULAR LAS CALORIAS QUE DEBE COMER
  #busque en una pagina "calculador de calorias del gobierno de Mexico y me dio las calorias para mi asi que 
  #quedo en activo *35 y sedentario *22.2 
  
  if(vida == "activo"){
    calorias<- peso * 35
  }else if (vida == "sedentario"){
    calorias <- peso * 22.2
  }else{
    print("Los datos proporcionados no son validos para el conteo de calorias, favor de revisar si los datos fueron escritos de manera correcta")
  }
  
  
} 

dieta