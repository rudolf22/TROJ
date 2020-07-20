function flag = check_density_sub(varargin)

%% Input parser:
% Default values of inputs:
default.id = ''; 
default.name = '';  
default.trivial_name = '';  
default.formula = ''; 

% Parse inputs:
var = inputParser;
var.addParameter('id', default.id, @(y) validateattributes(y,{'numeric'},{'nonnegative'}));
var.addParameter('name',default.name);
var.addParameter('trivial_name',default.trivial_name);
var.addParameter('formula',default.formula);
parse(var, varargin{:});
opt = var.Results;

id = opt.id;
name = opt.name;
trivial_name = opt.trivial_name ;
formula = opt.formula;

%% Initialisation
flag = 0;
valid = [];

%% Load options
ops = get_ops;

%% Check ID
if( isempty(id) == 0 )
    set_ops('name','id');
    [ro_id, out] = density_element(id);
end

%% Check NAME
if( isempty(name) == 0 )
    set_ops('name','name');
    [ro_name, out] = density_element(name);
end

%% Check TRIVIAL_NAME
if( isempty(trivial_name) == 0 )
    set_ops('name','trivial_name');
    [ro_trivial_name, out] = density_element(trivial_name);
end   

%% Check FORMULA
if( isempty(formula) == 0 )
    set_ops('name','formula');
    [ro_formula, out] = density_element(formula);
end   
%% Check validity
cnt = 1;
%% ID & NAME
if(( isempty(id) == 0 ) & ( isempty(name) == 0 ) )
    valid(cnt) = isequal(ro_id, ro_name);
    cnt = cnt + 1;
end
%% ID & TRIVIAL_NAME
if(( isempty(id) == 0 ) & ( isempty(trivial_name) == 0 ) )
    valid(cnt) = isequal(ro_id, ro_trivial_name);
    cnt = cnt + 1;
end
%% ID & FORMULA
if(( isempty(id) == 0 ) & ( isempty(formula) == 0 ) )
    valid(cnt) = isequal(ro_id, ro_formula);
    cnt = cnt + 1;
end
%% NAME & TRIVIAL_NAME
if(( isempty(name) == 0 ) & ( isempty(trivial_name) == 0 ) )
    valid(cnt) = isequal(ro_name, ro_trivial_name);
    cnt = cnt + 1;
end
%% NAME & FORMULA
if(( isempty(name) == 0 ) & ( isempty(formula) == 0 ) )
    valid(cnt) = isequal(ro_name, ro_formula);
    cnt = cnt + 1;
end
%% TRIVIAL_NAME & FORMULA
if(( isempty(trivial_name) == 0 ) & ( isempty(formula) == 0 ) )
    valid(cnt) = isequal(ro_trivial_name, ro_formula);
    cnt = cnt + 1;
end

%% Assign function OUTPUTS
if( sum(valid) == length(valid) )
    flag = 1;
else
    flag = 0;
end

end