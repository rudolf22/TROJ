function [M_mixture,out] = molar_mass(sub)
%% MOLAR_MASS
% 
%   The function molar_mass returns molar mass of compound or molar mass of mixtures.
%  
%   Syntax: 
%   [M_mixture,out] = molar_mass(sub)
%
%   M_mixture(class:double) - output: molar_mass for substance or mixture
%   out(class:struct) - output information, which contains:
%                       - unit - unit of physical value,
%                       - flag - parameter of reliability,
%                       - info - short information about correctness of result,
%                       - ver  - date of the latest update of program in form YYYY-MM-DD,
%                       - sub  - properties of substances.
%                       
%   sub(class:struct) - input structure of substance:
%                       - sub{k}.id - ID of substance,
%                       - sub{k}.x  - molar fraction of substance.
%
%   The molar mass of mixture is evaluated by for-cycle for given amount of substances:
%   M_mixture(k) = sum(M{k}*(sub{k}.x)),
%   where:    M{k} - molar mass of k-substance     [kg*mol^(-1)],
%         sub{k}.x - molar fraction of k-substance [1].
%
%   The physical unit of molar mass: [kg*mol^(-1)].
%
%   Example:
%   sub{1}.id = get_id('CH4');
%   sub{2}.id = get_id('S2');
%   sub{3}.id = get_id('H2S');
%   sub{4}.id = get_id('CS2');
%   sub{1}.x = 0.5;
%   sub{2}.x = 0.05;
%   sub{3}.x = 0.4;
%   sub{4}.x = 0.05;
%   [M_mixture,out] = molar_mass(sub)
%
%   M_mixture = 0.0287
%   out = 
%   struct with fields:
%    unit: 'kg*mol^(-1)'
%    flag: 1
%    info: 'No problem detected.'
%     ver: 20200412
%     sub: {[1×1 struct]  [1×1 struct]  [1×1 struct]  [1×1 struct]}
%  
%   SEE ALSO: GET_TABLE_OF_MOLAR_MASS, GET_TABLE_OF_ELEMENTS.
%
%   Reference:
%   https://pubchem.ncbi.nlm.nih.gov/periodic-table/.
%
%   LAST UPDATE: 2020-04-26.
%
flag = 0;
ops = get_ops; % Call options
dictionary = get_dictionary(ops.language); % Call dictionary
sub = normalize_molar_fraction(sub);
M_mixture = 0;
subs_ignored = [];
table_of_molar_mass = get_table_of_molar_mass();
for k = 1 : length(sub)
   if ( ( sub{k}.id >= 1 ) && ( sub{k}.id <= 118 ) )
        % Elements
        M{k} = molar_mass_element(sub{k}.id);
        flag = 1;
    elseif ((sub{k}.id >= 119) && (sub{k}.id <= 308))
        % Compounds
        M{k} = table_of_molar_mass{sub{k}.id}; 
        flag=1;
   else
        
        if (get_name(sub{k}.id)==Inf)
            disp(sprintf(dictionary.message.problem{1},mfilename,get_name(sub{k}.id))); % Subtance ID=%d not found!
        end
        disp(sprintf(dictionary.message.problem{2},mfilename,get_name(sub{k}.id))); % Subtance ID=%d ignored!
        M{k} = NaN;
        sub{k}.x=0;
        subs_ignored = [subs_ignored, k];
        sub = normalize_molar_fraction(sub);
    end
end %for k

subs_found = setdiff([1:length(sub)],subs_ignored);
for k=subs_found
    M_mixture(k) = M{k}*(sub{k}.x);
    
end
M_mixture = sum(M_mixture);
%% OUTPUTS
if ( length(subs_ignored) > 0 )
    flag = -1;
    if ( length(subs_found) == 0 )
        flag = 0;   
    end
end
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
out.sub = sub;

end %function