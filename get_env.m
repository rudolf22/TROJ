function [env,out] = get_env(varargin)
%% GET_ENV
% 
%   The function get_env returns physical conditions with preassure and temperature.
%   
%   Syntax:
%   env = get_env() - this form defines default values of pressure [Pa] and
%                     temperature [K]: p = 101325, T = 273.15 
%   env = get_env('p',X)
%   env = get_env('T',Y)
%
%   env(class:struct) - output which has always two fields: the first is
%                       defined/default pressure and the second is default/defined temperature
%
%   where the first is label of preassure, it means 'p' or label of temperature, it means 'T'  
%           X  - value of preassure   [Pa],
%           Y  - value of temperature [K],
%
%   Expanded syntax: 
%   env = get_env('p',X,'T',Y),
%   env = get_env('T',Y,'p',X),
%
%   where the first can be pressure and the second can be temperature or
%   backwards.
%
%   env(class:struct) - output which has always two fields: the first is
%                       always pressure and the second is temperature
%      
%   The physical units - pressure   [Pa],
%                      - temperature [K].
%
%   Example:
%   [env,out] = get_env('T',600,'p',800000)
%
%   env = 
%   struct with fields:
%    p: 800000
%    T: 600
%   out = 
%   struct with fields:
%    unit: {'Pa'  'K'}
%     ver: 20200412
%
%   SEE ALSO: GET_OPS.
%
%   LAST UPDATE: 2020-05-13.
%
ops = get_ops();
dictionary = get_dictionary(ops.language); % Call dictionary
%% Input parser:
% Default values of inputs:
default.p = 101325; % Pa
default.T = 273.15; % K

% Parse inputs:
var = inputParser;
var.addParameter('p', default.p, @(x) validateattributes(x,{'numeric'},{'nonempty'}));
var.addParameter('T', default.T, @(x) validateattributes(x,{'numeric'},{'nonempty'}));
parse(var, varargin{:});
opt = var.Results;

% Errors:
if (( 1 < length(opt.p) ) & ( 1 < length(opt.T) ))
    error(sprintf(dictionary.message.error{6}));
end
if (( opt.p < 0 ) & ( opt.T <= 0 ))
    error(sprintf(dictionary.message.error{7}));
end
if (( opt.p < 0 ) & ( opt.T >= 6000 ))
    error(sprintf(dictionary.message.error{8}));
end

if ( 1 < length(opt.p) )
    error(sprintf(dictionary.message.error{1}));
end
if ( 1 < length(opt.T) )
    error(sprintf(dictionary.message.error{2}));
end
if ( opt.T <= 0 )
    error(sprintf(dictionary.message.error{3}));
end
if ( opt.T >= 6000 )
    error(sprintf(dictionary.message.error{4}));
end
if ( opt.p < 0 )
    error(sprintf(dictionary.message.error{5}));
end
% Expand results: 
env.p = opt.p;
env.T = opt.T;
unit{1} = 'Pa';
unit{2} = 'K';
%% OUTPUT:
out.unit = unit;
out.ver = ops.version;
end