function [rho_l,out] = get_molar_density_l(env,sub)
%% GET_MOLAR_DENSITY_L
%
%   The function get_molar_density_l returns molar density of substance
%   for given temperature in liquid state.
%   Note: It is a support function for evaluation of density of mixture in liquid state.
%
%   Syntax:
%   [rho_l,out] = get_molar_density_l(env,sub)
%
%   rho_l(class:cell) - output: molar density of given substances 
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
%   The physical unit of molar density: [mol*m^(-3)].
%
%   References:
%   https://www.engineeringtoolbox.com/methane-density-specific-weight-temperature-pressure-d_2020.html,
%   https://www.engineeringtoolbox.com/hydrogen-H2-density-specific-weight-temperature-pressure-d_2044.html,
%   https://www.engineeringtoolbox.com/oxygen-O2-density-specific-weight-temperature-pressure-d_2082.html,
%   https://www.aqua-calc.com/page/density-table/substance/iodine-coma-and-blank-liquid,
%   https://en.wikipedia.org/wiki/Sulfur,
%   Bafrncova, S., Sefcikova, M., Vajda, M. Chemicke inzinierstvo Tabulky a grafy. 3.vyd. Bratislava: Nakladatelstvo STU, 2014. 115 s. ISBN 978-80-227-4270-2.
%   LAST UPDATE: 2020-05-13.
%
ops = get_ops();
dictionary = get_dictionary(ops.language); % Call dictionary
subs_ignored = [];
subs_phase_ignored = [];
for k = 1:length(sub)
    if sub{k}.id == 301 % methane
        T_exp = [100 111.51]; % [K]
        rho_exp = [27.36 26.34]*1e3; % [mol*m^{-3}]
        a = polyfit(T_exp,rho_exp,1);
        rho_l{k} = polyval(a,env.T);
        subs_flag(k) = 1;
    elseif sub{k}.id == 303 % carbon disulfide
        T_exp = [0 10 20 30 40 50 60]+273.15; % [K]
        rho_exp = [1293 1278 1263 1248 1233 1217 1200]; % [kg*m^{-3}]
        M{k} = molar_mass(sub(k)); % [kg*mol^{-1}]
        a = polyfit(T_exp,rho_exp,3);
        rho_l{k} = polyval(a,env.T)/M{k}; % [mol*m^{-3}]
        subs_flag(k) = 1;
    elseif sub{k}.id == 304 % hydrogen sulfide
        T_exp = [-60 -85.5]+273.15; % [K]
        rho_exp = [26877 29116]; % [mol*m^{-3}]
        a = polyfit(T_exp,rho_exp,1);
        rho_l{k} = polyval(a,env.T);
        subs_flag(k) = 1;
    elseif sub{k}.id == 305 % methanoic acid
        T_exp = [20 40 60 80 100]+273.15; % [K]
        rho_exp = [1220 1200 1180 1160 1135]; % [kg*m^{-3}]
        M{k} = molar_mass(sub(k)); % [kg*mol^{-1}]
        a = polyfit(T_exp,rho_exp,3);
        rho_l{k} = polyval(a,env.T)/M{k}; % [mol*m^{-3}]
        subs_flag(k) = 1;
    elseif sub{k}.id == 306 % ethanoic acid
        T_exp = [0 10 20 30 40 50 60 70 80 90 100]+273.15; % [K]
        rho_exp = [1072 1061 1040 1039 1027 1016 1005 993 982 970 958]; % [kg*m^{-3}]
        M{k} = molar_mass(sub(k)); % [kg*mol^{-1}]
        a = polyfit(T_exp,rho_exp,4);
        rho_l{k} = polyval(a,env.T)/M{k}; % [mol*m^{-3}]
        subs_flag(k) = 1;
    elseif sub{k}.id == 307 % oxidan
        T_exp = [0 10 20 30 40 50 60 70 80 90 100]+273.15; % [K]
        rho_exp = [999.9 999.7 998.2 995.7 992.2 988 983.2 977.8 971.8 965.3 958.4]; % [kg*m^{-3}]
        M{k} = molar_mass(sub(k)); % [kg*mol^{-1}]
        a = polyfit(T_exp,rho_exp,4);
        rho_l{k} = polyval(a,env.T)/M{k}; % [mol*m^{-3}]
        subs_flag(k) = 1;
    elseif sub{k}.id == 308 % carbon dioxide
        rho_l{k} = Inf; % [mol*m^{-3}]
        subs_flag(k) = -1;
    elseif sub{k}.id == 201 % dihydrogen
        T_exp = [20 20.23]; % [K]
        rho_exp = [35.29 25.16]*1e3; % [mol*m^{-3}]
        a = polyfit(T_exp,rho_exp,1);
        rho_l{k} = polyval(a,env.T); % [mol*m^{-3}]
        subs_flag(k) = 1;
    elseif sub{k}.id == 207 % dinitrogen
        rho_l{k} = Inf; % [mol*m^{-3}]
        subs_flag(k) = -1;
    elseif sub{k}.id == 208 % dioxygen
        T_exp = [54.37 60 80 90.06]; % [K]
        rho_exp = [40.81 40.06 37.22 35.69]*1e3; % [mol*m^{-3}]
        a = polyfit(T_exp,rho_exp,2);
        rho_l{k} = polyval(a,env.T); % [mol*m^{-3}]
        subs_flag(k) = 1;
    elseif sub{k}.id == 209 % difluorine
        rho_l{k} = Inf; % [mol*m^{-3}]
        subs_flag(k) = -1;
    elseif sub{k}.id == 216 % disulfur
        rho_exp = 1.819*1e3; % [kg*m^{-3}]
        M{k} = molar_mass(sub(k)); % [kg*mol^{-1}]
        rho_l{k} = rho_exp/M{k}; % [mol*m^{-3}]
        subs_flag(k) = 1;
    elseif sub{k}.id == 217 % dichlorine
        rho_l{k} = Inf; % [mol*m^{-3}]
        subs_flag(k) = 1;
    elseif sub{k}.id == 235 % dibromine
        rho_exp = 3120; % [kg*m^{-3}]
        M{k} = molar_mass(sub(k)); % [kg*mol^{-1}]
        rho_l{k} = rho_exp/M{k}; % [mol*m^{-3}]
        subs_flag(k) = 1;
    elseif sub{k}.id == 253 % diiodine
        rho_exp = 3.96*1e3; % [kg*m^{-3}]
        M{k} = molar_mass(sub(k)); % [kg*mol^{-1}]
        rho_l{k} = rho_exp/M{k}; % [mol*m^{-3}]
        subs_flag(k) = 1;
    else
            if (get_name(sub{k}.id)==Inf)
                disp(sprintf(dictionary.message.problem{1},mfilename,get_name(sub{k}.id))); % Subtance ID=%d not found!
            end
            disp(sprintf(dictionary.message.problem{2},mfilename,get_name(sub{k}.id))); % Subtance ID=%d ignored!
            rho_l{k} = Inf;
            sub{k}.x = 0;
            subs_flag(k) = 0;
            phase_flag(k) = 0;
            %sub_phase{k} = 'non-defined';
            subs_ignored = [subs_ignored, k];
            subs_phase_ignored = [subs_phase_ignored, k];
            sub = normalize_molar_fraction(sub);
    end
end
for k = 1:length(sub)
    if (isinf(rho_l{k})==1)
        phase{k} = 'non-defined';
    else
        phase{k} = 'l';
    end
end
%% OUTPUTS
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
%% UNIT
out.unit = 'mol*m^(-3)';
%% PHASE
out.phase = phase;
out.flag = subs_flag;
if ( flag == 1 )
    out.info = dictionary.message.info{1}; % No problem detected
elseif ( flag == -1 )
    out.info = dictionary.message.info{3}; % Something was ignored or not found!
else 
    out.info = dictionary.message.info{2}; % Problem detected!
end
out.ver = ops.version;
out.sub = sub;