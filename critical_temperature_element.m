function [Tc_element,out] = critical_temperature_element(sub)
%% CRITICAL_TEMPERATURE_ELEMENT
% 
%   The function critical_temperature_element returns critical temperature of given element.
%  
%   Syntax: 
%   [Tc_element,out] = critical_temperature_element(sub)
%
%   Tc_element(class:double) - output critical_temperature for element
%   out(class:struct) - output information, which contains:
%                       - unit - unit of physical value,
%                       - flag - parameter of reliability,
%                       - info - short information about correctness of result,
%                       - ver  - date of the latest update of program in form YYYY-MM-DD,
%                       - id   - identification number, representing by atomic number of element.
%                               
%   sub(class:char or double) - input: ID or name or formula of element
%  
%   The critical temperature of element is specified on basis of data
%   through function get_table_of_critical_temperature.
%
%   The physical unit of critical temperature of given element is Kelvin [K].
%
%   Example:
%   [Tc_element,out] = critical_temperature_element('Pd')
%
%   Tc_element = 7100
%   out = 
%   struct with fields:
%    unit: 'K'
%    flag: 1
%    info: 'No problem detected.'
%     ver: 20200412
%      id: 46
%
%   SEE ALSO: CRITICAL_TEMPERATURE, GET_TABLE_OF_CRITICAL_TEMPERATURE_ELEMENT.
% 
%   Reference:
%   http://www.knowledgedoor.com/2/elements_handbook/critical_point.html
%
%   LAST UPDATE: 2020-04-26
%
flag = 0;
ops = get_ops(); % Load options
dictionary = get_dictionary(ops.language); % Call dictionary
table_of_critical_temperature_element = get_table_of_critical_temperature_element(); % Load table of Critical temperature of elements
id = get_id(sub);
if( ( id >= 1 ) & ( id <= 118 ) )
     Tc_element = table_of_critical_temperature_element{id};
     flag = 1;
else 
    Tc_element = Inf; % Philosophers stone
    if (Tc_element==Inf)
        disp(sprintf(dictionary.message.problem{9},mfilename,get_name(get_id(sub)))); % Subtance ID=%d not found!
    end
        disp(sprintf(dictionary.message.problem{2},mfilename,get_name(get_id(sub)))); % Subtance ID=%d ignored!
    flag = -1;
end
%% OUTPUTS

out.unit = 'K';
out.flag = flag;

dictionary = get_dictionary(ops.language); % Call dictionary

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