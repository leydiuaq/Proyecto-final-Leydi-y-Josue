#Generar una dieta a partir de los siguientes datos:
#a) Peso del usuario
#b) Estatura del usuario 
#c) Actividad (activa, moderada, sedentaria)
#d) Podriamos poner un apartado de alergias 
#e) sexo (vi que las calorias no son iguales para hombres y mujeres)

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