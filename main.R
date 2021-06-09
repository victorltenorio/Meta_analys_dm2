# Title     : TODO
# Objective : TODO
# Created by: elton
# Created on: 12/03/2021

#carrega o pacote para a metanálise
library(meta)

#Carrega os dados tabulados
dados_tabulados_genero <- read.csv("DataSet/changes_of_fecal_microbiota.csv")

#Prepara os arquivo com os dados continuos
meta_genero <- metacont(ne, me, sde, nc, mc, sdc, data = dados_tabulados_genero,
                        sm = "SMD", byvar = Filo, studlab = estudo)
#Gera o forest plot.
forest(meta_genero,
       label.left = "Favours [Experimental]",
       label.right = "Favours [Control]",
       leftcols = c("studlab", "ne", "me", "sde", "nc", "mc", "sdc", "Genero", "Especie"  ),
       leftlabs = c("Study","N.e" , "Mean.e", "SD.e", "N.c" , "Mean.c", "SD.c", "Genus", "Especie" ),
)

#Legenda
# Study - Autor e ano do estudo.
# N.e - Total de Participantes do grupo experimental.
# Mean.e - Media da variação dos gêneros bacterianos do grupo experimental.
# SD.e - Desvio padrão variação dos gêneros bacterianos do grupo experimental.
# N.c - Total de Participantes de grupo controle
# Mean.c - Media da variação dos gêneros bacterianos do grupo controle.
# SD.c - Desvio padrão variação dos gêneros bacterianos do grupo controle.
# Genus - Gênero da Bacteria.