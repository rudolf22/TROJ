function [rho_element,out] = density_element(sub)
%% DENSITY_ELEMENT
% 
%   The function density_element returns specific density of given element at the temperature 293.15 K.
%   Note: Density of gases is defined at 273.15 K and 101325 Pa.
%   Syntax: 
%   [rho_element,out] = density_element(sub)
%
%   rho_element(class:double) - output: specific density for element
%   out(class:struct) - output information, which contains:
%                       - unit - unit of physical value,
%                       - flag - parameter of reliability,
%                       - info - short information about correctness of result,
%                       - ver  - date of the latest update of program in form YYYY-MM-DD,
%                       - id   - identification number, representing by atomic number of element.
%                               
%   sub(class:char or double) - input: ID or name or formula of element
%  
%
%   The physical unit of specific density of given element: [kg*m^(-3)].
%
%   Example:
%   [rho_element,out] = density_element('Ca')
%
%   rho_element = 1540
%   out = 
%   struct with fields:
%    unit: 'kg*m^(-3)'
%    flag: 1
%    info: 'No problem detected.'
%     ver: 20200412
%      id: 20
%
%   SEE ALSO: DENSITY, GET_TABLE_OF_ELEMENTS.
%
%   The density of element is evaluated on basis of data from internet database using API interface: 
%   https://pubchem.ncbi.nlm.nih.gov/periodic-table/
%
%
%   LAST UPDATE: 2020-04-26
%
flag = 0;
ops = get_ops(); % Load options
dictionary = get_dictionary(ops.language); % Call dictionary
table_of_elements = get_table_of_elements(); % Load table of elements
id = get_id(sub);
if ( ( id >= 1 ) & ( id <= 118 ) )
    if (isempty(str2num(table_of_elements.Table.Row(id).Cell{15}))==1)
        rho_element = Inf;
        flag = -1;
    else
        rho_element = str2num(table_of_elements.Table.Row(id).Cell{15})*1000;
        flag = 1;
    end
else 
    rho_element = Inf; % Philosophers stone
    if (rho_element==Inf)
        disp(sprintf(dictionary.message.problem{9},mfilename,get_name(get_id(sub)))); % Subtance ID=%d not found!
    end
        disp(sprintf(dictionary.message.problem{2},mfilename,get_name(get_id(sub)))); % Subtance ID=%d ignored!
    flag = -1;
end

%% OUTPUTS

out.unit = 'kg*m^(-3)';
out.flag = flag;

if ( flag == 1 )
    out.info = dictionary.message.info{1}; % No problem detected
elseif ( flag == -1 )
    out.info = dictionary.message.info{3}; % Something was ignored or not found!
else 
    out.info = dictionary.message.info{2}; % Problem detected!
end

out.ver = ops.version;
out.id = id;
end