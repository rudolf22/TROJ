function [rho_mixture, out] = real_molar_density(env,sub)
%% MOLAR_DENSITY
% 
%   The function molar_density returns molar density of compound or
%   mixtures for given temperature and pressure.
%   Note: Pressure is activated for only gases. 
%  
%   Syntax: 
%   [rho_mixture, out] = molar_density(env,sub)
%
%  rho_mixture(class:double) - output: molar density for substance or mixture
%  out(class:struct) - output information, which contains:
%                       - unit - unit of physical value,
%                       - flag - parameter of reliability,
%                       - phase - phase of each defined substance of mixture,
%                       - info - short information about correctness of result,
%                       - ver  - date of the latest update of program in form YYYY-MM-DD,
%                       - sub  - properties of substances.
%
%  env(class:struct) - input: stucture of pressure and temperature                       
%  sub(class:struct) - input structure of substance:
%                       - sub{k}.id - ID of substance,
%                       - sub{k}.x  - molar fraction of substance.
%
%  The molar density is evaluated by for-cycle for given amount of substances:
%  rho_mixture(k) = sum(rho{k}*(sub{k}.x)),
%  where:  
%          rho{k} - molar density of k-substance  [mol*m^(-3)],
%        sub{k}.x - molar fraction of k-substance [1].
%
%  The unit of molar density: [mol*m^(-3)]
%  See also: DENSITY_ELEMENT, WEIGHT_DENSITY, DENSITY.
%  
%  Example:
%  
%  sub{1}.id = get_id('CH4');
%  sub{1}.x = 0.5;
%  sub{2}.id = get_id('H2S');
%  sub{2}.x = 0.25;
%  sub{3}.id = get_id('CS2');
%  sub{3}.x = 0.25;
%  [rho_mixture,out] = molar_density(env,sub)
%  env = get_env('p',101325,'T',473.15);
%
%  rho_mixture =
%
%           25.8120
%
%   out = 
%
%       struct with fields:
%
%          unit: 'mol*m^(-3)'
%          flag: 1
%    phase_flag: 1
%         phase: {'g'  'g'  'g'}
%          info: 'No problem detected.'
%           ver: 20200412
%           sub: {[1×1 struct]  [1×1 struct]  [1×1 struct]}
%  
%  LAST UPDATE: 2020-04-19 
% 
%
flag = 0;
rho_mixture=0;
ops = get_ops; % Call options
sub = molar2weight_fraction(sub);
%sub = normalize_weight_fraction(sub);
sub = normalize_molar_fraction(sub);
dictionary = get_dictionary(ops.language);
table_of_elements = get_table_of_elements();
table_of_temperatures = get_table_of_temperatures();
table_of_van_der_waals_coef = get_table_of_van_der_waals_coef();
subs_ignored = [];
subs_phase_ignored = [];
for k = 1 : length(sub)
        if (((sub{k}.id >= 1 ) & (sub{k}.id <= 308 )))
                T=env.T;
                p=env.p;
                if (T >= table_of_temperatures{3,sub{k}.id+1})
                    coef = table_of_van_der_waals_coef(:,sub{k}.id);
                    a = coef(1);
                    b = coef(2);
                    R = 8.314;
                    sub_phase{k} = 'g';
                    phase_flag(k) = 1;
                    subs_flag(k) = 1;
                    if a == Inf
                        disp(sprintf(dictionary.message.problem{8},mfilename));
                        rho{k} = Inf;
                        sub_phase{k} = 'g';
                        
                    else
                        rho{k} = roots([a*b -a (R*T+p*b) -p]);
                        v = size(rho{k},1);
                        if ((real(rho{k}(1:v))>=0))
                            index = find(imag(rho{k})==0,v);
                            if (size(index,1) == 1)
                                rho{k} = rho{k}(index);
                                phase_flag(k) = 1;
                                subs_flag(k) = 1;
                                sub_phase{k} = 'g';
                            elseif (size(index,1) > 1)
                            rho1 = rho{k}(index(1));
                            rho2 = rho{k}(index(2));
                            rho3 = rho{k}(index(3));
                            rhog = [rho1 rho2 rho3];
                            rho{k} = min(rhog);
                            phase_flag(k) = 1;
                            subs_flag(k) = 1;
                            sub_phase{k} = 'g';
                            end
                        else 
                            rho{k} = Inf;
                            disp('Error !')
                            sub_phase{k} = 'g';
                            
                        end
                    end
                elseif ( T <= table_of_temperatures{3,sub{k}.id+1} )  & ( T >= table_of_temperatures{2,sub{k}.id+1} )
                    if (sub{k}.id>=1 & sub{k}.id<=118) & (isequal(table_of_elements.Table.Row(sub{k}.id).Cell{12,1},"Liquid"))
                        rho{k} = density_element(sub{k}.id)/molar_mass_element(sub{k}.id);
                        sub_phase{k} = 'l';
                        subs_flag(k) = 1;
                        phase_flag(k) = 1;
                        
                    else
                        [rho_l,out_l] = get_molar_density_l(env,sub);
                        rho{k}=rho_l{k};
                        sub_phase{k} = 'l';
                        subs_flag(k) = out_l.flag(k);
                        phase_flag(k) = 1;
                    end
                elseif ( T <= table_of_temperatures{2,sub{k}.id+1} )
                    if ((sub{k}.id>=1 & sub{k}.id<=118) & (isequal(table_of_elements.Table.Row(sub{k}.id).Cell{12,1},"Solid")))
                        rho{k} = density_element(sub{k}.id)/molar_mass_element(sub{k}.id);
                        sub_phase{k} = 's';
                        subs_flag(k) = 1;
                        phase_flag(k) = 1;
                    else
                        rho{k} = Inf;
                        sub_phase{k} = 's';
                        
                    end
                        
                end
                        if (rho{k}==Inf)
                            sub{k}.w = 0;
                            sub{k}.x = 0;
                            sub = normalize_weight_fraction(sub);
                            sub = normalize_molar_fraction(sub);
                            subs_flag(k) = -1;
                            phase_flag(k) = -1;
                            subs_phase_ignored = [subs_phase_ignored, k];
                            disp(sprintf(dictionary.message.problem{2},mfilename,get_name(sub{k}.id))); % Subtance ID=%d not found!
                        
                        end
        else
            if (get_name(sub{k}.id)==Inf)
                disp(sprintf(dictionary.message.problem{1},mfilename,get_name(sub{k}.id))); % Subtance ID=%d not found!
            end
            disp(sprintf(dictionary.message.problem{2},mfilename,get_name(sub{k}.id))); % Subtance ID=%d ignored!
            rho{k} = Inf;
            sub{k}.x = 0;
            sub{k}.w = 0;
            subs_flag(k) = 0;
            phase_flag(k) = 0;
            sub_phase{k} = 'non-defined';
            subs_ignored = [subs_ignored, k];
            subs_phase_ignored = [subs_phase_ignored, k];
            sub = normalize_molar_fraction(sub);

        end
end
for k = 1 : length(sub)
    subs_phase{k}=sub_phase{k};
end
%% Update list of ignored substances with those that have not FLAG==1 (were neglected)
for k = 1 : length(subs_flag)
    if(subs_flag(k) ~= 1)
        subs_ignored = [subs_ignored, k];
        sub{k}.x = 0;
    end
end
sub = normalize_molar_fraction(sub);
subs_found = setdiff([1:length(sub)],subs_ignored);
subs_phase_found = setdiff([1:length(sub)],subs_phase_ignored);
sub = normalize_molar_fraction(sub);


for k = (subs_phase_ignored)
        if (isequal(sub_phase{k},'non-defined'))
            rho{k} = Inf;
            subs_flag(k) = -1;
            phase_flag(k) = -1;
        else
            rho{k}=rho{k};
            subs_flag(k) = subs_flag(k);
            phase_flag(k) = 1;
            
        
        end
end
for k = subs_phase_found
    rho_mixture(k) = rho{k}*(sub{k}.w)*molar_mass(sub(k));
end
rho_mixture = sum(rho_mixture)/molar_mass(sub);
%% OUTPUTS


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

unique_subs_flag_phase = unique(phase_flag);
is_flag_no_problem_phase = find(unique_subs_flag_phase == 1);
is_flag_neglected_phase = find(unique_subs_flag_phase == -1);
is_flag_problem_phase = find(unique_subs_flag_phase == 0);
if( isempty(is_flag_problem_phase) == 0 )
    p_flag = 0;
elseif( isempty(is_flag_neglected_phase) == 0 )
    p_flag = -1;
elseif( isempty(is_flag_no_problem_phase) == 0 )
    p_flag = 1;
end

    if ( length(subs_ignored) > 0 )
        flag = -1;
        if (( length(subs_found) == 0 ))
            flag = 0;  
        end
    end


out.unit = 'mol*m^(-3)';

out.flag = flag;
out.phase_flag = p_flag;
out.phase = subs_phase;

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