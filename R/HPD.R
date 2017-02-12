######################################################################
  ############# hpd intervals #########################
### started here ### 

sink("landmark_HPD.txt")

print("landmark data--hier modeling")
print("N1x")
print(summary(hier_samples)$quantiles[1,] )

print("S1x")
print(summary(hier_samples)$quantiles[3,] )

print("N2x")
print(summary(hier_samples)$quantiles[5,] )

print("S2x")
print(summary(hier_samples)$quantiles[7,] )

print("N3x")
print(summary(hier_samples)$quantiles[9,] )

print("S3x")
print(summary(hier_samples)$quantiles[11,] )

print("N4x")
print(summary(hier_samples)$quantiles[13,] )

print("S4x")
print(summary(hier_samples)$quantiles[15,] )

print("N5x")
print(summary(hier_samples)$quantiles[17,] )

print("S5x")
print(summary(hier_samples)$quantiles[19,] )

print("N6x")
print(summary(hier_samples)$quantiles[21,] )

print("S6x")
print(summary(hier_samples)$quantiles[23,] )

print("N7x")
print(summary(hier_samples)$quantiles[25,] )

print("S7x")
print(summary(hier_samples)$quantiles[27,] )

print("N8x")
print(summary(hier_samples)$quantiles[29,] )

print("S8x")
print(summary(hier_samples)$quantiles[31,] )

print("N9x")
print(summary(hier_samples)$quantiles[33,] )

print("S9x")
print(summary(hier_samples)$quantiles[35,] )

print("N10x")
print(summary(hier_samples)$quantiles[37,] )

print("S10x")
print(summary(hier_samples)$quantiles[39,] )

print("N11x")
print(summary(hier_samples)$quantiles[41,] )

print("S11x")
print(summary(hier_samples)$quantiles[43,] )

print("N12x")
print(summary(hier_samples)$quantiles[45,] )

print("S12x")
print(summary(hier_samples)$quantiles[47,] )

print("N13x")
print(summary(hier_samples)$quantiles[49,] )

print("S13x")
print(summary(hier_samples)$quantiles[51,] )



###

print("N1y")
print(summary(hier_samples)$quantiles[2,] )

print("S1y")
print(summary(hier_samples)$quantiles[4,] )

print("N2y")
print(summary(hier_samples)$quantiles[6,] )

print("S2y")
print(summary(hier_samples)$quantiles[8,] )

print("N3y")
print(summary(hier_samples)$quantiles[10,] )

print("S3y")
print(summary(hier_samples)$quantiles[12,] )

print("N4y")
print(summary(hier_samples)$quantiles[14,] )

print("S4y")
print(summary(hier_samples)$quantiles[16,] )

print("N5y")
print(summary(hier_samples)$quantiles[18,] )

print("S5y")
print(summary(hier_samples)$quantiles[20,] )

print("N6y")
print(summary(hier_samples)$quantiles[22,] )

print("S6y")
print(summary(hier_samples)$quantiles[24,] )

print("N7y")
print(summary(hier_samples)$quantiles[26,] )

print("S7y")
print(summary(hier_samples)$quantiles[28,] )

print("N8y")
print(summary(hier_samples)$quantiles[30,] )

print("S8y")
print(summary(hier_samples)$quantiles[32,] )

print("N9y")
print(summary(hier_samples)$quantiles[34,] )

print("S9y")
print(summary(hier_samples)$quantiles[36,] )

print("N10y")
print(summary(hier_samples)$quantiles[38,] )

print("S10y")
print(summary(hier_samples)$quantiles[40,] )

print("N11y")
print(summary(hier_samples)$quantiles[42,] )

print("S11y")
print(summary(hier_samples)$quantiles[44,] )

print("N12y")
print(summary(hier_samples)$quantiles[46,] )

print("S12y")
print(summary(hier_samples)$quantiles[48,] )

print("N13y")
print(summary(hier_samples)$quantiles[50,] )

print("S13y")
print(summary(hier_samples)$quantiles[52,] )



sink()


