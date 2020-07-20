function [Tc,out] = critical_temperature(sub)
%% CRITICAL_TEMPERATURE
%  
%   The function critical_temperature returns critical temperature of substance.
%  
%   Syntax: 
%   [Tc,out] = critical_temperature(sub)
%
%   Tc(class:cell)    - output of critical temperature 
%   out(class:struct) - output information, which contains:
%                       - unit - unit of physical value,
%                       - flag - parameter of reliability,
%                       - info - short information about correctness of result,
%                       - ver  - date of the latest update of program in form YYYY-MM-DD,
%                       - sub  - properties (ID) of substances.
%
%   sub(class:struct) - input: ID of substances
%
%   The physical unit of critical temperature is Kelvin [K].
%
%   Example:
%   sub{1}.id = get_id('CH4');
%   sub{2}.id = get_id('N2');
%   sub{3}.id = get_id('O2');
%   sub{4}.id = get_id('CS2');
%   [Tc,out] = critical_temperature(sub)
%
%   Tc =
%       1×4 cell array
%    {[190.5788]}    {[126.1612]}    {[154.5890]}    {[545.8192]}
%   out = 
%   struct with fields:
%    unit: 'K'
%    flag: 1
%    info: 'No problem detected.'
%     ver: 20200412
%     sub: {[1×1 struct]  [1×1 struct]  [1×1 struct]  [1×1 struct]}
%
%   SEE ALSO: CRITICAL_TEMPERATURE_ELEMENT, GET_TABLE_OF_VAN_DER_WAALS_COEF.
% 
%   Reference:
%   Bafrncova, S., Sefcikova, M., Vajda, M. Chemicke inzinierstvo Tabulky a grafy. 3.vyd. Bratislava: Nakladatelstvo STU, 2014. 115 s. ISBN 978-80-227-4270-2.
%   https://www.engineeringtoolbox.com/non-ideal-gas-van-der-Waals-equation-constants-gas-law-d_1969.html
%
%   LAST UPDATE: 2020-04-26
%
flag = 0;
ops = get_ops; % Call options
dictionary = get_dictionary(ops.language); % Call dictionary
table_of_van_der_waals_coef = get_table_of_van_der_waals_coef();
subs_ignored = [];
for k = 1 : length(sub)
    if ( (sub{k}.id >= 1 ) & ( sub{k}.id <= 118 ) )
        Tc{k} = critical_temperature_element(sub{k}.id);
        flag = 1;
    elseif ( (sub{k}.id >= 119 ) & (sub{k}.id <= dictionary.id(end) ) )
        coef = table_of_van_der_waals_coef(:,sub{k}.id);
        a = coef(1);
        b = coef(2);
        R = 8.314;
        Tc{k} = (8/27)*(1/R)*(a/b);
        flag = 1;
    else
        Tc{k} = Inf;
        if (get_name(sub{k}.id)==Inf)
            disp(sprintf(dictionary.message.problem{1},mfilename,get_name(sub{k}.id))); % Subtance not found!
        end
        flag = -1;
        
    end
    
end % for k


for k = 1:length(sub)
    Tc{k} = Tc{k};
    if (Tc{k} == Inf)
        disp(sprintf(dictionary.message.problem{2},mfilename,get_name(sub{k}.id))); % Subtance ignored!
        flag = -1;
    end
end
Tc = Tc;
%% OUTPUTS

out.unit = 'K';
out.flag = flag;


if ( flag == 1 )
    out.info = dictionary.message.info{1}; % No problem detected
elseif ( flag == -1 )
    out.info = dictionary.message.info{3}; % Something was ignored or not found!
else 
    out.info = dictionary.message.info{2}; % Problem detected!
end

out.ver = ops.version;
out.sub = sub;
end %function