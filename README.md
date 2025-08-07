# PastMath
Reproduction materials for the paper "The Economic and Ecological Impact of Dairy Production in Alpine Prehistory: A Numerical Approach"

## Instruction to run the code

`PastMath_Iterations.R` is the main script, it sources `PastMath_Equations.R` in the folder *Equations* to perform the model and export the outcomes (as table and plots). Model parameters for each model scenario are stored in separate scripts in the folder *Parameters*: `Scenario1_Parameters.R`, `Scenario2_Parameters.R`, `Scenario3_Parameters.R`, `Scenario4_Parameters.R`.

`PastMath_Test_Iterations.R` performs a series of sensitivity tests to assess the influence of different parameters on the model outcomes. It sources `PatMath_Test.R` in the *Equation* folder and uses model parameters from the script `Scenario2_Test` in the folder *Parameters*. 

The folder *Figures* contains all the plots produced using the scripts described above.