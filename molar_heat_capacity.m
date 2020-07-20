function [cp_mixture,out] = molar_heat_capacity(env,sub)
%% MOLAR_HEAT_CAPACITY
%
%   The function molar_heat_capacity returns molar heat capacity of substance or mixture
%   for given temperature.
%   Note: The substance which is not found, it will be neglected !
%
%   Syntax:
%   [cp_mixture,out] = molar_heat_capacity(env,sub)
%
%   cp_mixture(class:double) - output: molar heat capacity of mixture 
%   out(class:struct) - output information, which contains:
%                       - unit - unit of physical value,
%                       - flag - parameter of reliability,
%                       - phase - phase of each defined substance of mixture,
%                       - info - short information about correctness of result,
%                       - ver  - date of the latest update of program in form YYYY-MM-DD,
%                       - sub  - properties of substances.
%
%   env(class:struct) - input: stucture of pressure and temperature                       
%   sub(class:struct) - input structure of substance:
%                       - sub{k}.id - ID of substance,
%                       - sub{k}.x  - molar fraction of substance.
%   
%   The formula of evaluation molar heat capacity of these substances in gaseous phase:
%   methane (ID 301): cp{k} = -(9.46454303446242e-14)*T.^5 + (4.05791640315958e-10)*T.^4 - (6.84295932518767e-07)*T.^3 + 0.000543481289054056*T.^2 - 0.144194370114123*T + 45.6316152199757,
%   disulphur (ID 302): cp{k} = (1.09e-3).*T+36.11-3.51e5*(T.^(-2)), 
%   carbon disulfide (ID 303): cp{k} = 0.135882.*t.^(-2)+26.88412+18.67809.*t+3.434203.*t.^2-3.378702.*t.^3;  t = T/1000,
%   hydrogen sulfide (ID 304): cp{k} = -0.224831.*t.^(-2)+35.85391+52.49121.*t-40.83743.*t.^2+12.00155.*t.^3; t = T/1000,
%   where:
%   T - thermodynamic temperature [K],
%   t - normalized temperature    [K],
%   cp{k} - molar heat capacity of the considered k-substance [J*mol^(-1)*K^(-1)],
%   k - number of given substance [1].
%
%   The molar heat capacity is evaluated by for-cycle for given amount of substances:
%   for k = 1:length(sub)
%       cp_blend(k)=(cp{k}*(sub{k}.x));
%   end
%   cp_blend=sum(cp_blend)
%   where:
%   cp_blend - molar heat capacity of the considered mixture [J*mol^(-1)*K^(-1)],
%   cp{k} - molar heat capacity of k-substance which contains the considered mixture [J*mol^(-1)*K^(-1)],
%   sub{k}.x - molar fraction of k-substance which is in the considered mixture [1],
%   k - number of given substance [1].
%   
%   The physical unit of molar heat capacity: [J*mol^(-1)*K^(-1)].
%
%   Example:
%   env = get_env('p',101325,'T',773.15);
%   sub{1}.id = get_id('CH4');
%   sub{1}.x = 0.5;
%   sub{2}.id = get_id('H2S');
%   sub{2}.x = 0.25;
%   sub{3}.id = get_id('CS2');
%   sub{3}.x = 0.25;
%   [cp_mixture, out] = molar_heat_capacity(env,sub)
%
%   cp_mixture = 55.6182
%   out = 
%   struct with fields:
%     unit: 'J*mol^(-1)*K^(-1)'
%    phase: {'g'  'g'  'g'}
%     flag: 1
%     info: 'No problem detected.'
%      ver: 20200412
%      sub: {[1×1 struct]  [1×1 struct]  [1×1 struct]}
%
%   SEE ALSO: GET_TABLE_OF_TEMPERATURES.
%
%   References:
%   https://www.engineeringtoolbox.com/methane-d_980.html, 
%   https://chemiday.com/en/thermodynamic, 
%   https://webbook.nist.gov/cgi/cbook.cgi?ID=C7783064&Mask=1&Type=JANAFG&Table=on#JANAFG, 
%   https://webbook.nist.gov/cgi/cbook.cgi?ID=C75150&Mask=7&Type=JANAFG&Table=on#JANAFG.
%   
%   LAST UPDATE: 2020-04-26.
%
flag = 0;
sub = normalize_molar_fraction(sub);
cp_mixture=0;
ops = get_ops; % Call options
dictionary = get_dictionary(ops.language);
table_of_temperatures = get_table_of_temperatures();
subs_ignored = [];
subs_phase_ignored = [];
Nk = length(sub);
for k = 1 : Nk
    if (sub{k}.id ==301 )
        if( env.T >= table_of_temperatures{3,sub{k}.id+1} )
        T = [200 225 250 275 300 325 350 375 400 450 500 550 600 650 700 750 800 850 900 950 1000 1050 1100];
        Cpexp = [2.087 2.121 2.156 2.191 2.226 2.293 2.365 2.442 2.525 2.703 2.889 3.074 3.256 3.432 3.602 3.766 3.923 4.072 4.214 4.348 4.475 4.595 4.708]*16.04;
        Pol = polyfit(T,Cpexp,5);
        cp{k} = polyval(Pol,env.T);
        subs_flag(k) = 1;
        sub_phase{k} = 'g';
        else
            cp{k} = NaN;
            subs_flag(k) = -1;
            sub_phase{k} = 'non-defined';
        end
    elseif (sub{k}.id == 216)
        if( env.T >= table_of_temperatures{3,sub{k}.id+1} )
        T = env.T;
        cp{k} = ((1.09e-3).*T+36.11-3.51e5*(T.^(-2))); % [kJ/kmol/K]
        subs_flag(k) = 1;
        sub_phase{k} = 'g';
        else
            cp{k} = NaN;
            subs_flag(k) = -1;
            sub_phase{k} = 'non-defined';
        end
    elseif (sub{k}.id == 304)
        if( env.T >= table_of_temperatures{3,sub{k}.id+1})
        T = env.T;
        t = T/1000;
        cp{k} = (0.135882.*t.^(-2)+26.88412+18.67809.*t+3.434203.*t.^2-3.378702.*t.^3); % [kJ/kmol/K]
        subs_flag(k) = 1;
        sub_phase{k} = 'g';
        else
            cp{k} = NaN;
            subs_flag(k) = -1;
            sub_phase{k} = 'non-defined';
        end
    elseif (sub{k}.id == 303)
        if( env.T >= table_of_temperatures{3,sub{k}.id+1}) 
        T = env.T;
        t = T/1000;
        cp{k} = (-0.224831.*t.^(-2)+35.85391+52.49121.*t-40.83743.*t.^2+12.00155.*t.^3); % [kJ/kmol/K]
        subs_flag(k) = 1;
        sub_phase{k} = 'g';
        else
            cp{k} = NaN;
            subs_flag(k) = -1;
            sub_phase{k} = 'non-defined';
        end
    else
        if (get_name(sub{k}.id)==Inf)
            disp(sprintf(dictionary.message.problem{1},mfilename,get_name(sub{k}.id))); % Subtance ID=%d not found!
            disp(sprintf(dictionary.message.problem{2},mfilename,get_name(sub{k}.id))); % Subtance ID=%d ignored!
        end
        
        cp{k} = 0;
        sub{k}.x = 0;
        subs_ignored = [subs_ignored, k];
        sub = normalize_molar_fraction(sub);
        subs_flag(k) = 0;
        sub_phase{k} = 'non-defined';
    end
end %for k
%% Update list of ignored substances with those that have not FLAG==1 (were neglected)
for k = 1 : length(subs_flag)
    if(subs_flag(k) ~= 1)
        subs_ignored = [subs_ignored, k];
        sub{k}.x = 0;
        disp(sprintf(dictionary.message.problem{2},mfilename,get_name(sub{k}.id)));
    end
end
for k = 1:length(sub)
    if (sum(sub{k}.x)==0)
        sub{k}.x = sub{k}.x;
    else
        sub = normalize_molar_fraction(sub);
    end
end
%% 
subs_found = setdiff([1:length(sub)],subs_ignored);
if (length(subs_found) == 0)
    cp_mixture = NaN;
end
for k = subs_found
    cp_mixture(k)=(cp{k}*(sub{k}.x));
end %for
cp_mixture=sum(cp_mixture);
%% FLAG
unique_subs_flag = unique(subs_flag);
is_flag_no_problem = find(unique_subs_flag == 1);
is_flag_neglected = find(unique_subs_flag == -1);
is_flag_problem = find(unique_subs_flag == 0);
if( isempty(is_flag_problem) == 0 )
    flag = 0;
elseif( isempty(is_flag_neglected) == 0 )
    flag = -1;
elseif( isempty(is_flag_no_problem) == 0 )
    flag = 1;
end
%% OUTPUTS
if ( length(subs_ignored) > 0 )
    flag = -1;
    if ( length(subs_found) == 0 )
        flag = 0;   
    end
end
out.unit = 'J*mol^(-1)*K^(-1)';
out.phase = sub_phase;
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

end % function