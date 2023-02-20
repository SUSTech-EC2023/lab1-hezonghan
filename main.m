clc
clear
fitFunc = 'objFunc'; % name of objective/fitness function
T = 200; % total number of evaluations
population_size = 4;
[bestSoFarFit, bestSoFarSolution] = simpleEA(fitFunc, T, population_size);
