function [weight_rho_mixture, out_weight, molar_rho_mixture, out_molar] = real_density(env,sub)
%% DENSITY
%
%   The function density returns values of weight and molar density for
%   given temperature and pressure.
%   Note: Pressure is activated for only gases. 
%
%   Syntax: 
%   [weight_rho_mixture, out_weight, molar_rho_mixture, out_molar] = density(env,sub)
%
%  weight_rho_mixture(class:double) - output: weight density for substance or mixture
%  molar_rho_mixture(class:double) - output: molar density for substance or mixture
%  out_weight(class:struct) - output information for weight density which contains:
%                       - unit - unit of physical value,
%                       - flag - parameter of reliability,
%                       - phase - phase of each defined substance of mixture,
%                       - info - short information about correctness of result,
%                       - ver  - date of the latest update of program in form YYYY-MM-DD,
%                       - sub  - properties of substances.
%
%  out_molar(class:struct) - output information for molar density which contains:
%                       - unit - unit of physical value,
%                       - flag - parameter of reliability,
%                       - phase - phase of each defined substance of mixture,
%                       - info - short information about correctness of result,
%                       - ver  - date of the latest update of program in form YYYY-MM-DD,
%                       - sub  - properties of substances.
%  env(class:struct) - input: stucture of pressure and temperature                       
%  sub(class:struct) - input structure of substance:
%                       - sub{k}.id - ID of substance,
%                       - sub{k}.x  - molar fraction of substance,
%                       - sub{k}.w  - weight fraction of substance.
%  The weight density is evaluated by for-cycle for given amount of substances:
%  rho_mixture(k) = sum(rho{k}*(sub{k}.w)),
%  where:  
%          rho{k} - weight density of k-substance  [kg*m^(-3)],
%        sub{k}.x - weight fraction of k-substance [1].
%
%  The unit of weight density: [kg*m^(-3)].
%
%  The molar density is evaluated by for-cycle for given amount of substances:
%  rho_mixture(k) = sum(rho{k}*(sub{k}.x)),
%  where:  
%          rho{k} - molar density of k-substance  [mol*m^(-3)],
%        sub{k}.x - molar fraction of k-substance [1].
%
%  The unit of molar density: [mol*m^(-3)]
%
%  See also: DENSITY_ELEMENT, WEIGHT_DENSITY, MOLAR_DENSITY.
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
%   sub = molar2weight_fraction(sub);
%   env = get_env()
%   [weight_rho_mixture, out_weight, molar_rho_mixture, out_molar] = density(env,sub)
%
%   weight_rho_mixture =
%
%           1.2937
%
%   out_weight = 
%
%       struct with fields:
%
%          unit: 'kg*m^(-3)'
%          flag: 1
%    phase_flag: 1
%         phase: {'g'  'g'  'g'  'g'}
%          info: 'No problem detected.'
%           ver: 20200412
%           sub: {[1×1 struct]  [1×1 struct]  [1×1 struct]  [1×1 struct]}
%
%   molar_rho_mixture =
%
%           44.6638
%
%   out_molar = 
%
%       struct with fields:
%
%          unit: 'mol*m^(-3)'
%          flag: 1
%    phase_flag: 1
%         phase: {'g'  'g'  'g'  'g'}
%          info: 'No problem detected.'
%           ver: 20200412
%           sub: {[1×1 struct]  [1×1 struct]  [1×1 struct]  [1×1 struct]}
%
%   LAST UPDATE: 2020-04-19
%

[weight_rho_mixture, out_weight] = weight_density(env,sub);
[molar_rho_mixture, out_molar] = molar_density(env,sub);
end