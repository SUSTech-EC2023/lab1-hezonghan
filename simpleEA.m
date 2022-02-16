function [bestSoFarFit ,bestSoFarSolution ...
    ]=simpleEA( ...  % name of your simple EA function
    fitFunc, ... % name of objective/fitness function
    T, ... % total number of evaluations
    input) % replace it by your input arguments

% Check the inputs
if isempty(fitFunc)
  warning(['Objective function not specified, ''' objFunc ''' used']);
  fitFunc = 'objFunc';
end
if ~ischar(fitFunc)
  error('Argument FITFUNC must be a string');
end
if isempty(T)
  warning(['Budget not specified. 1000000 used']);
  T = '1000000';
end
eval(sprintf('objective=@%s;',fitFunc));
% Initialise variables
nbGen = 0; % generation counter
nbEval = 0; % evaluation counter
bestSoFarFit = 0; % best-so-far fitness value
bestSoFarSolution = NaN; % best-so-far solution
%recorders
fitness_gen=[]; % record the best fitness so far
solution_gen=[];% record the best phenotype of each generation
fitness_pop=[];% record the best fitness in current population 
%% Below starting your code

% Initialise a population
%% TODO
populationSize = 4;
lowerBound = 0;
upperBound = 31;
lenGene = 5;
population = randi([lowerBound,upperBound],populationSize,1);
genotypes = dec2bin(population);

% Evaluate the initial population
%% TODO
fitness = objective(population);
[A,index] = sort(fitness,1,'descend');
fitness_pop=[fitness_pop,A(1)]
for i = 1:populationSize
    if fitness(i) > bestSoFarFit
        bestSoFarFit = fitness(i);
        bestSoFarSolution = population(i,:);
    end
end

nbEval = nbEval + populationSize;
nbGen =  nbGen +1;
fitness_gen=horzcat(fitness_gen, bestSoFarFit);
solution_gen=horzcat(solution_gen, bestSoFarSolution);
% Start the loop
while (nbEval<T) % [QUESTION] this stopping condition is not perfect, why?
% Reproduction (selection, crossver)
%% TODO
crossoverProb = fitness./sum(fitness); % roulette-wheel selection
offspringGenes = [];
for i = 1:populationSize/2
    parentIndexes = [];
    for j = 1:2
        r = rand();
        for index = 1:populationSize
            if r>sum(crossoverProb(1:index-1)) && r<=sum(crossoverProb(1:index))
                break;
            end
        end
        parentIndexes = [parentIndexes, index];
    end
    crossoverPoint = randi(lenGene-1);
    offspringGenes = [offspringGenes; [genotypes(parentIndexes(1),1:crossoverPoint), genotypes(parentIndexes(2),crossoverPoint+1:end)]];
    offspringGenes = [offspringGenes; [genotypes(parentIndexes(2),1:crossoverPoint), genotypes(parentIndexes(1),crossoverPoint+1:end)]];
end
% Mutation
%% TODO

mutationProb = 1/lenGene;
for i = 1:populationSize
    isMutation = rand(1,lenGene)<mutationProb;
    offspringGenes(i,isMutation) = dec2bin('1'-offspringGenes(i,isMutation))';
end
genotypes = offspringGenes;
population = bin2dec(genotypes);
fitness = objective(population);
[A,index] = sort(fitness,1,'descend');
fitness_pop=[fitness_pop,A(1)]
for i = 1:populationSize
    if fitness(i) > bestSoFarFit
        bestSoFarFit = fitness(i);
        bestSoFarSolution = population(i,:);
    end
end
nbEval = nbEval + populationSize;
nbGen = nbGen + 1;
fitness_gen=horzcat(fitness_gen, bestSoFarFit);
solution_gen=horzcat(solution_gen, bestSoFarSolution);
end
bestSoFarFit
bestSoFarSolution

figure,plot(1:nbGen,fitness_gen,'b') 
title('Fitness\_Gen')

figure,plot(1:nbGen,solution_gen,'b') 
title('Solution\_Gen')

figure,plot(1:nbGen,fitness_pop,'b') 
title('Fitness\_Pop')



