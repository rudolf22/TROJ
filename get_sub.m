function sub = get_sub(varargin)
%% GET_SUB
%
%   The function returns identification number and molar fraction of defined substance.
%
%   Syntax:
%   sub = get_sub('name','A')
%   sub = get_sub('meno','A')
%
%   A(class:string) - input, it can be name in english/slovak language and formula of
%   defined substance
%   sub(class:struct) - has always two fields the first is id. number and
%   the second is default molar fraction of this defined substance
%   Default molar fraction for each substance x = 1.
%
%   Expanded syntax:
%   sub = get_sub('name','A','x',X)
%   sub = get_sub('meno','A','x',X)
%   sub = get_sub('x',X,'name','A')
%   sub = get_sub('x',X,'meno','A')
%   sub = get_sub('name','A','x',X,'phase','P')
%   sub = get_sub('meno','A','x',X,'faza','P')
%
%   A(class:string) - input, it can be name in english/slovak language and formula of
%   defined substance
%   X(class:double) - value of molar fraction of defined substance from 0 to 1
%   sub(class:struct) - has always two or three fields the first is id. number and
%   the second is default molar fraction of this defined substance and the
%   third is P - phase of substance, P = g/l/s
%
%   Example:
%   sub = get_sub('name','CH4','x',0.2)
%
%   sub = 
%   struct with fields:
%   id: 301
%    x: 0.2000
%
%   SEE ALSO: GET_SUBS, GET_ID, GET_NAME.
%
%   LAST UPDATE: 2020-04-26.
%

%% Input parser:
% Default values of inputs:
default.name = '';  % Name of substance
default.meno = '';  % Name of substance
default.x = 1;      % Molar fraction

% Parse inputs:
var = inputParser;
var.addParameter('name', default.name);
var.addParameter('meno', default.name);
var.addParameter('x', default.x, @(y) validateattributes(y,{'numeric'},{'nonnegative','nonempty'}));
parse(var, varargin{:});
opt = var.Results;

% Check name of substance
if(isempty(opt.name))
    if(isempty(opt.meno))
        opt.name = 'Philosophers Stone';
    else
        opt.name = opt.meno; % SK -> EN
    end
end



% Expand results: 
sub{:}.id = get_id(opt.name);
sub{:}.x = opt.x;

end