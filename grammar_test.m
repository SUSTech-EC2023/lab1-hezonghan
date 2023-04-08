
clc
clear

% arr = [];
% arr(2) = 12345
% arr(1) = 123
% % arr(0) = 234;
% arr


% randi([10 12])  % 10 <= output <= 12
% randi([10 12], [3 4])  % shape of 3 rows and 4 columns
% randi([10 12], 6)  % shape of 6 rows and 6 columns


% for a=1:2
%     a
%     a
% end


% objFunc(22)


% arr = [222 333 444]
% arr(2)

% a = 5.^2


func_name = 'objFunc'
% func_name(22)  % 索引超出数组元素的数目(7)。
% eval(func_name+'('+22+')')
% @func_name(22)


% func_name = 'objFunc'
% eval(sprintf('objective=@%s;',func_name));
% initial_populations = rand(3,5) * (300-100) + 100
% objective(initial_populations)


addpath('E:\5_Study\0131_ECIA\Assignments\assignment_01\Assignment1\benchmark');
% [func_name, lb, ub, dimensions] = deal('ackley', (-32), (+32), 30);
% [func_name, lb, ub, dimensions] = deal('michal', (0), (+pi), 2);
% eval(sprintf('objective=@%s;',func_name));
% initial_populations = rand(2,5) * (ub-lb) + lb
% objective(initial_populations)


% [func_name, lb, ub, dimensions] = deal('miao', (0), (3), 5);
[func_name, lb, ub, dimensions] = deal('miao', (+4), (+8), 5);
eval(sprintf('objective=@%s;',func_name));
% initial_populations = rand(30,5) * (ub-lb) + lb
initial_populations = randi([lb  ub] , dimensions , 31)
[arr , len , y] = objective(initial_populations)

% arr = population_evaluate(@objective , initial_populations)  % 函数或变量 'objective' 无法识别。
arr = population_evaluate(@miao , initial_populations)
% arr = population_evaluate(objective , initial_populations)
% [arr , len , y] = miao([4 ; 5 ; 6 ; 7 ; 8])  % OK
% [arr , len , y] = @miao([4 ; 5 ; 6 ; 7 ; 8])  % 表达式无效。调用函数或对变量进行索引时，请使用圆括号。否则，请检查不匹配的分隔符。
% [arr , len , y] = objective([4 ; 5 ; 6 ; 7 ; 8])  % OK
% [arr , len , y] = @objective([4 ; 5 ; 6 ; 7 ; 8])  % 表达式无效。调用函数或对变量进行索引时，请使用圆括号。否则，请检查不匹配的分隔符。

% rand(2,3,4,5)
% size([2 2 2 2 ; 3 3 3 3])  % [2 4]

appended_list = [100  200  300]
appended_list = [appended_list  400]
appended_list(5) = 500
appended_list(8) = 800

best = min([200  400  100])
% arg_min([200 300 100 600 500])  % 函数或变量 'arg_min' 无法识别。

appended_matrix = [[100  200] ; [400 300]]
appended_matrix = [appended_matrix ;  [400  500]]

matrix_A = [[100  200] ; [400 300]]
matrix_B = [[400  700] ; [800 500]]
% matrix_C = [matrix_A   matrix_B]
matrix_C = [matrix_A ; matrix_B]

my_sort([200 400 300 600 500]);
my_sort([2000 ; 4000 ; 3000 ; 6000 ; 5000]);

appended_list
selected = appended_list([1 3 5])

matrix_C
selected = matrix_C([2 4] , :)
selected = matrix_C([2 ; 4] , :)

[10 20 30] * 0.2 + [10000 20000 30000] * 0.8

% len = 1000*1000*100;
% arr = randi([500 600000], [len 1]);
% size(arr)
% sorted_table = my_sort(arr);
% size(sorted_table)


% 请将 "miao" 函数定义后面的所有语句都移到第一个局部函数定义前面。
% function [y] = miao(a,b,c,d,e)
%     y = 10000 * a + 1000 * b + 100 * c + 10 * d + e
% end
function [arr , len , y] = miao(arr)
    len = length(arr);  % length() : Length of largest array dimension
    y = 10000 * arr(1) + 1000 * arr(2) + 100 * arr(3) + 10 * arr(4) + arr(5);
end

function [population_objectives] = population_evaluate(obj_f , population_solutions)
    [dimensions , population_size] = size(population_solutions)
    for i=1:population_size
        % population_solutions(: , i)
        % obj_f(population_solutions(: , i))
        % population_objectives(i) = obj_f(population_solutions(: , i))
        
        [arr , len , y] = obj_f(population_solutions(: , i));
        population_objectives(i) = y;
    end
end

function [table] = my_sort(data_list)
    original_size = size(data_list);
    if original_size(1) == 1  % && original_size(2) > 1
        cnt = original_size(2);
    else
        cnt = original_size(1);
    end
    data_col = reshape(data_list , [cnt 1]);
    idx_col  = reshape(1:cnt , [cnt 1]);
    
    table = [data_col  idx_col]
    table = sortrows(table)
end
sort