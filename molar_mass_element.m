function [M_element,out] = molar_mass_element(sub)
%% MOLAR_MASS_ELEMENT
% 
%   The function molar_mass_element returns molar mass of given element.
%  
%   Syntax: 
%   [M_element,out] = molar_mass_element(sub)
%
%   M_element(class:double) - output: molar mass for element
%   out(class:struct) - output information, which contains:
%                       - unit - unit of physical value,
%                       - flag - parameter of reliability,
%                       - info - short information about correctness of result,
%                       - ver  - date of the latest update of program in form YYYY-MM-DD,
%                       - id   - identification number, representing by atomic number of element.
%                       
%   sub(class:char or double) - input: ID or name or formula of element
%
%   The physical unit of molar mass of given element: [kg*mol^(-1)]
%
%   Example:
%   [M_element,out] = molar_mass_element('Pd')
%
%   M_element = 0.1064
%   out = 
%   struct with fields:
%    unit: 'kg*mol^(-1)'
%    flag: 1
%    info: 'No problem detected.'
%     ver: 20200412
%      id: 46
%
%   SEE ALSO: GET_TABLE_OF_ELEMENTS, MOLAR_MASS.
%
%   Reference:
%   https://pubchem.ncbi.nlm.nih.gov/periodic-table/.
%
%   LAST UPDATE: 2020-04-26.
%
flag = 0;
ops = get_ops(); % Load options
dictionary = get_dictionary(ops.language); % Call dictionary
table_of_elements = get_table_of_elements(); % Load table of elements
id = get_id(sub);
if ( ( id >= 1 ) & ( id <= 118 ) )
     M_element = str2num(table_of_elements.Table.Row(id).Cell{4})/1000;
     flag = 1;
else 
    M_element = Inf; % Philosophers stone
    if (M_element==Inf)
        disp(sprintf(dictionary.message.problem{9},mfilename,get_name(get_id(sub)))); % Subtance ID=%d not found!
    end
        disp(sprintf(dictionary.message.problem{2},mfilename,get_name(get_id(sub)))); % Subtance ID=%d ignored!
    flag = -1;
end
%% OUTPUTS

out.unit = 'kg*mol^(-1)';
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