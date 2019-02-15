library(dplyr)

############ nice colorblind pallete found at http://www.cookbook-r.com/Graphs/Colors_(ggplot2)/ ###############
cbb8 <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")
save(cbb8, file = '../data/cbb8.RData')


############ another nice pallete from http://mkweb.bcgsc.ca/colorblind/img/colorblindness.palettes.simple.png #############

## ordering from dark to light

# indistinguishible pairs for tritanopia:
#                            *--------------------*          *------------------------------------------------------*          *---------------------*
#                           |                    |          |                                                      |          |                     |
cbb12 <- tibble(col = c("#016E82", "#8115A0", "#005AC8", "#00A0FA", "#F978FA", "#18D2DC", "#AA093C", "#FA7850", "#10B45A", "#F0F031", "#A1FA82", "#FAE6BE"),
                dark2light = c( 1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12),
                contrast   = c( 1,  8, 10, 12,  2,  5,  6,  4,  3, 11,  7,  9),
                tritanopia = c( 1,  2,  1,  3,  4,  5,  6,  7,  3,  8,  9,  8),
                dropTrit   = c( F,  F,  T,  F,  F,  F,  F,  F,  T,  F,  F,  T))

save(cbb12, file = '../data/cbb12.RData')
