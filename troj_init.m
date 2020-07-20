%% Initialize important data
%
%   Toolbox TROJ was initialized.
%   Authors: Trautenberger, Oravec.
%   The latest update 21.6.2020.
%

self_ops
update_table_of_elements % download table of elements using Internet
table_of_elements = get_table_of_elements; % call table of elements
ops = get_ops; % call ops
% ops.language='SK';
 ops.language='EN';
%ops.language = 'DE';
disp('Toolbox TROJ was initialized.')
disp('Authors: Trautenberger, Oravec.')   
disp('The latest update 21.6.2020.')