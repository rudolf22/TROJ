function flag = set_ops(varargin)
%% SET_OPS
%
%   The function set_ops provides to change important data to adjust information about evaluation.
%   The important data: language of toolbox, information subject to name,
%   fomula of trivial-name of substance, and the latest version of toolbox.
%
%   SEE ALSO: GET_OPS, SELF_OPS.
%
%   LAST UPDATE: 2020-04-26.
%
%% Initialize global variable OPS
global ops

%% Input parser:
% Default values of inputs:
default.language = ops.language;  % Choice of language (EN,DE,SK)
default.name = ops.sub.name;  % Choice of information of substance (name,formula,trivial-name)
default.version = ops.version; % Date of updated version (YYYY-MM-DD)

% Parse inputs:
var = inputParser;
var.addParameter('name', default.name);
var.addParameter('language', default.language);
var.addParameter('version', default.version);
parse(var, varargin{:});
opt = var.Results;

flag = 1; % No problem detected

% Check name
if( isequal(opt.name, "id") | isequal(opt.name, "name") | isequal(opt.name, "trivial_name") |  isequal(opt.name, "formula") )
    ops.sub.name = opt.name;
else
    flag = 0; % Problem detected
end

% Check language
if( isequal(opt.language, "EN") | isequal(opt.language, "SK") | isequal(opt.language, "DE") )
    ops.language = opt.language;
else
    flag = 0; % Problem detected
end

% Check version
if( isnumeric(opt.version) )
    ops.version = opt.version;
else
    flag = 0; % Problem detected
end

end % function 