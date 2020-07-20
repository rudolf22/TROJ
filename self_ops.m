function self_ops()
%% TOOLBOX SELF-SETTINGS
%   
%   The function self_ops loads basic information to prove setup communication properly.
%   This function saves infromation about: 
%   - language setup (EN, SK, DE),
%   - substance name setup (name,formula,id,trivial-name).
%
%   SEE ALSO: GET_OPS, SET_OPS.
%
%   LAST UPDATE: 2020-04-26.
%
try 
    % Check if global variable OPS exists
    lang = ops.language;
catch
    %% Initialize global variable OPS
    global ops 
    %% Language setup:
%   ops.language = 'SK';
    ops.language = 'EN';
%    ops.language = 'DE';
    %% Substance Name Setup
     ops.sub.name = 'name';
   %  ops.sub.name = 'formula';
%     ops.sub.name = 'id';
%     ops.sub.name = 'trivial_name';
    %% Version info:
    ops.version = 20200621;
end
