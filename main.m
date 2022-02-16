fitFunc = 'objFunc'; % name of objective/fitness function
T = 1000000; % total number of evaluations
[bestSoFarFit, bestSoFarSolution] = simpleEA(fitFunc, T);