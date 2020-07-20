function [u_mixture,out] = dynamic_viscosity(env,sub)
%% DYNAMIC_VISCOSITY
%
%   The function dynamic_viscosity returns dynamic viscosity of substance
%   or mixture for given temperature and substance.
%   Note: The substance which is not found, it will be neglected !
%
%   Syntax:
%   [u_mixture,out] = dynamic_viscosity(env,sub)
%
%   u_mixture(class:cell) - output: dynamic_viscosity for substance or mixture 
%   out(class:struct)   - output information, which contains:
%                         - unit - unit of physical value,
%                         - flag - parameter of reliability,
%                         - info - short information about correctness of result,
%                         - ver  - date of the latest update of program in form YYYY-MM-DD,
%                         - sub  - properties of substances.
%
%   env(class:struct)   - input structure of environment:
%                         - pressure    [Pa],
%                         - temperature [K].
%   sub(class:struct)   - input structure of substances:
%                         - name or identification number,
%                         - molar fraction [1] or ratio [%].
%
%   The formula of evaluation dynamic viscosity of given substance in gaseous phase:
%   u{k} = u0*((273+C)/(T+C))*(T/273)^(1.5)
%   where:   u0 - dynamic viscosity of gas at 273.15 K      [Pa*s],
%            C - constant which is dependent on kind of gas [K].
%   
%   List of u0 and C of considered substances:
%   methane (ID 301): u0 = 10.22e-6, C = 164;
%   disulphur (ID 302): none;
%   carbon disulfide (ID 303): u0 =  8.86e-6, C = 499.5;
%   hydrogen sulfide (ID 304): u0 = 11.66e-6, C = 331.
%
%   The gaseous mixture dynamic viscosity is evaluated by for-cycle for given amount of substances:
%   for k = 1:length(sub)
%        Tc(k) = critical_temperature(sub(k));
%        M{k} = molar_mass(sub(k));
%        u_mixture1(k) = (u{k}*(sub{k}.x)*sqrt(M{k}*Tc{k}));
%        u_mixture2(k) = ((sub{k}.x)*sqrt(M{k}*Tc{k}));    
%   end
%   u_mixture = sum(u_mixture1)/sum(u_mixture2);
%   where:  
%           sub.x{k} - molar fraction of k-substance                    [1]
%               M{k} - molar mass of k-substance                        [kg*mol^(-1)]
%              Tc(k) - critical temperature of k-substance              [K]
%               u{k} - dynamic viscosity of k-substance                 [Pa*s] 
%        u_mixture1(k) - vector of k-numerators                         [Pa*s*(kg*mol^(-1)*K)^(0.5)]
%        u_mixture2(k) - vector of k-denominators                       [(kg*mol^(-1)*K)^(0.5)]
%            u_mixture - dynamic viscosity of the considered mixture    [Pa*s] 
%                  k - number of given substance                        [1]
%
%   The physical unit of mixture dynamic viscosity: [Pa*s].
%
%   Example:
%   sub{1}.id = get_id('CH4');
%   sub{1}.x = 40;
%   sub{2}.id = get_id('CS2');
%   sub{2}.x = 50;
%   sub{3}.id = get_id('H2S');
%   sub{3}.x = 10;
%   [u_mixture,out] = dynamic_viscosity(get_env('p',101325,'T',873),sub)
%
%   u_mixture = 2.8292e-05
%   out = 
%   struct with fields:
%     unit: 'Pa*s'
%    phase: {'g'  'g'  'g'}
%     flag: 1
%     info: 'No problem detected.'
%      ver: 20200412
%      sub: {[1×1 struct]  [1×1 struct]  [1×1 struct]}
%
%   SEE ALSO: MOLAR_MASS, CRITICAL_TEMPERATURE, GET_TABLE_OF_TEMPERATURES.
%
%   Reference:
%   Bafrncova, S., Sefcikova, M., Vajda, M. Chemicke inzinierstvo Tabulky a grafy. 3.vyd. Bratislava: Nakladatelstvo STU, 2014. 115 s. ISBN 978-80-227-4270-2.
%
%   LAST UPDATE: 2020-04-26.
%
flag = 0;
sub = normalize_molar_fraction(sub);
subs_ignored = [];
ops = get_ops();
dictionary = get_dictionary(ops.language); % Call dictionary
table_of_temperatures = get_table_of_temperatures();
%% Initialisation of evaluation of U_mixture
u_mixture1 = 0;
u_mixture2 = 0;
        
%% Evaluate all substances
Nk = length(sub);
for k = 1 : Nk

    if (sub{k}.id == 301 )
        if( env.T >= table_of_temperatures{3,sub{k}.id+1} )
            T=env.T;
            u0=10.22e-6;
            C=164;
            u{k} = u0*((273+C)/(T+C))*(T/273)^(1.5);
            subs_flag(k) = 1;
            sub_phase{k} = 'g';
        else
            u{k} = NaN;
            subs_flag(k) = -1;
            sub_phase{k} = 'non-defined';
        end
    elseif (sub{k}.id == 304)
        if( env.T >= table_of_temperatures{3,sub{k}.id+1} )
            T = env.T;
            u0=11.66e-6;
            C=331;
            u{k} = u0*((273+C)/(T+C))*(T/273)^(1.5);
            subs_flag(k) = 1;
            sub_phase{k} = 'g';
        else
            u{k} = NaN;
            subs_flag(k) = -1;
            sub_phase{k} = 'non-defined';
        end
    elseif (sub{k}.id == 303)
        if( env.T >= table_of_temperatures{3,sub{k}.id+1} )
            T = env.T;
            u0=8.86e-6;
            C=499.5;
            u{k} = u0*((273+C)/(T+C))*(T/273)^(1.5);
            subs_flag(k) = 1;
            sub_phase{k} = 'g';
        else
            u{k} = NaN;
            subs_flag(k) = -1;
            sub_phase{k} = 'non-defined';
        end
    else
        
        
        if (get_name(sub{k}.id) == Inf)
            disp(sprintf(dictionary.message.problem{1},mfilename,get_name(sub{k}.id))); % Subtance ID=%d not found!
            disp(sprintf(dictionary.message.problem{2},mfilename,get_name(sub{k}.id))); % Subtance ID=%d ignored!
        end
        
        
        u{k} = 0; 
        sub{k}.x=0;
        subs_ignored = [subs_ignored, k];
        sub = normalize_molar_fraction(sub);
        subs_flag(k) = 0;
        sub_phase{k} = 'non-defined';
    end
end % for k

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
%% Compute u_mixture for non-ignored substances
subs_found = setdiff([1:length(sub)],subs_ignored);
for k = subs_found
    Tc(k) = critical_temperature(sub(k));
    M{k} = molar_mass(sub(k));
    u_mixture1(k) = (u{k}*(sub{k}.x)*sqrt(M{k}*Tc{k}));
    u_mixture2(k) = ((sub{k}.x)*sqrt(M{k}*Tc{k}));
end
u_mixture = sum(u_mixture1)/sum(u_mixture2);


%% OUTPUTS:

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

%% Ignored Substances
if ( length(subs_ignored) > 0 )
    flag = -1;
    if ( length(subs_found) == 0 )
        flag = 0;  
    end
end
%% Unit
out.unit = 'Pa*s';
%% Phase
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