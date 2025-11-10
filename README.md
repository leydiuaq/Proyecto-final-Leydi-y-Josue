# Proyecto-final-Leydi-y-Josue
Proyecto final de entrega el 19 de noviembre de 2025. 
puede sver que modfico algo (Josue)
toda esta linea de texto es parqa remplazar todos los valores que no sean A,G,T,C por A (le pedi ayuda a chat gpt para esto)
fasta_limpio <- lapply(fasta_tarea2, function(seq) {
  seq_str <- as.character(seq)
  seq_str <- gsub("[^ACGT]", "A", seq_str)  # cualquier cosa distinta de A,C,G,T se vuelve A
  DNAString(seq_str)
})


fasta_limpio <- DNAStringSet(fasta_limpio)
#esta función le indica a R que busque el patrón que "GATTACA dentro de la secuencia
vcountPattern("GATTACA", fasta_limpio)

#esta función le pide a R que traduszca el objeto
AA<-translate(fasta_limpio)
AA


#aqui le indico a R que me haga un archivo (fasta) donde este el contenido del objeto AA en la dirección donde esta mi proyecto
writeXStringSet(AA, file= "tarea_proteinas.fasta")

library(msa)
library(ggmsa)

#EMPEZAR A HACER ALINEAMIENTO DE LAS PROTEINAS
sec_proteinas <- readAAStringSet("tarea_proteinas.fasta") #pedir que te lea el archivo creado anteriormente y generar un objeto a partir de este

# Alineamiento con ClustalW
ali_clustal <- msa(sec_proteinas, method="ClustalW") #permite hacer el alineamiento con el metodo Clustal W y  generar un objeto a partir de lo que te salga
ali_clustal
# Alineamiento con MUSCLE
ali_muscle <- msa(sec_proteinas, method="Muscle") #esta función permite hacer el alineamiento por metodo muscle
print(ali_muscle)

#generar matriz de distancia

library(seqinr)
alin_clustal<- msaConvert(ali_clustal, type="seqinr::alignment")#Para convertir este alineamiento a un objeto que nos permita hacer un arbol
alin_muscle<- msaConvert(ali_muscle, type="seqinr::alignment")#Para convertir este alineamiento a un objeto que nos permita hacer un arbol
matriz_d <- dist.alignment(alin_clustal, "identity") #Primero calculamos una matriz de distancias
matriz_d
as.matrix(matriz_d)[11:11,, drop=FALSE] # con esto convertimos el objeto d en una matriz cuadrada de distancias


#hacemos el arbol filogenético
library(ape)
GATTACATree <- njs(matriz_d)
plot(GATTACATree, main="Arbol Filogenetico de las Seecuencias proteínas homólogas Tarea 2, parte 5")

