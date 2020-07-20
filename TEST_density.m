clear 
clc
%% Density of air
sub{1}.id = get_id('N2');
sub{1}.x = 78.084;
sub{2}.id = get_id('O2');
sub{2}.x = 20.946;
sub{3}.id = get_id('Ar');
sub{3}.x = 0.934;
sub{4}.id = get_id('CO2');
sub{4}.x = 0.033;
env = get_env('T',273.15+0);
[rho_mixture, out] = density(env,sub)