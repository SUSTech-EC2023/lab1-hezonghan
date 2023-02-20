function [bestSoFarFit ,bestSoFarSolution ...
    ]=simpleEA( ...  % name of your simple EA function
    fitFunc, ... % name of objective/fitness function
    T, ... % total number of evaluations
    population_size ...
    )
    % input) % replace it by your input arguments

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
% Note: this is not aimed at printing the function name to console, 
% but at obtaining the function pointer by its name (string).
% sprintf('objective=@%s;',fitFunc)


% Initialise variables
nbGen = 0; % generation counter
nbEval = 0; % evaluation counter

bestSoFarFit = 0; % best-so-far fitness value
bestSoFarSolution = NaN; % best-so-far solution

% evolving process recorders
fitness_gen=[]; % record the best fitness so far
solution_gen=[];% record the best phenotype of each generation
fitness_pop=[];% record the best fitness in current population 
%% Below starting your code

%%
% Initialise a population

% current_solutions = [];
% for sol_id=1:population_size
%     current_solutions(sol_id) = randi([0  31]);
% end
% current_solutions

current_solutions = randi([0  31], [1  population_size])


%%
% Evaluate the initial population

% current_solutions_fitness = [];
% for sol_id=1:population_size
%     % sol_id
%     % current_solutions(sol_id)
%     % fitFunc(12)
%     % fitFunc(current_solutions(sol_id))
%     % current_solutions_fitness(sol_id) = fitFunc(current_solutions(sol_id))
%     current_solutions_fitness(sol_id) = objective(current_solutions(sol_id))
% end
% current_solutions_fitness

current_solutions_fitness = objective(current_solutions)


%%
% Start the loop
while (nbEval<T) 
    nbGen = nbGen + 1;
    
    % Reproduction (selection, crossver)

    % Mutation

end


bestSoFarFit
bestSoFarSolution





