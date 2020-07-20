function [rho_mixture, out] = density(env,sub)
%% DENSITY
%
%   The function density returns value of density of substance or mixture 
%   for given composition, temperature and pressure.
%   Note: Pressure is activated for only gases.
%
%   Syntax: 
%   [rho_mixture, out] = density(env,sub)
%
%   rho_mixture(class:double) - output: weight density for substance or mixture
%   out(class:struct) - output information for weight density which contains:
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
%   The weight density is evaluated by for-cycle for given amount of substances:
%   rho_mixture(k) = 1/sum((sub{k}.w)/rho{k}),
%   where:  
%          rho{k} - density of k-substance         [kg*m^(-3)],
%        sub{k}.w - weight fraction of k-substance [1].
%
%   The physical unit of mixture density: [kg*m^(-3)].
%
%   See also: DENSITY_ELEMENT, WEIGHT_DENSITY.
%
%   Example:
%   sub{1}.id = get_id('N2');
%   sub{1}.x = 78.084;
%   sub{2}.id = get_id('O2');
%   sub{2}.x = 20.946;
%   sub{3}.id = get_id('Ar');
%   sub{3}.x = 0.934;
%   sub{4}.id = get_id('CO2');
%   sub{4}.x = 0.033;
%   env = get_env('p',101325,'T',273.15);
%   [rho_mixture,out] = density(env,sub)
%
%   rho_mixture = 1.2923
%   out = 
%   struct with fields:
%          unit: 'kg*m^(-3)'
%          flag: 1
%    phase_flag: 1
%         phase: {'g'  'g'  'g'  'g'}
%          info: 'No problem detected.'
%           ver: 20200412
%           sub: {[1×1 struct]  [1×1 struct]  [1×1 struct]  [1×1 struct]}
%
%   SEE ALSO: WEIGHT_DENSITY, DENSITY_ELEMENT, MOLAR_MASS.
%   
%   Reference:
%   https://pubchem.ncbi.nlm.nih.gov/periodic-table/.
%
%   LAST UPDATE: 2020-04-26
%
[rho_mixture, out] = weight_density(env,sub);
end