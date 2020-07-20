clear
clc
%% Help of dynamic viscosity
help dynamic_viscosity
%% Dynamic viscosity of 3 substances
clear sub
sub{1}.id = get_id('CH4');
sub{2}.id = get_id('CS2');
sub{3}.id = get_id('H2S');
sub{1}.x = 0.7;
sub{2}.x = 0.1;
sub{3}.x = 0.2;
env = get_env('T',873);
[u_mixture, out] = dynamic_viscosity(env,sub)
%% Dynamic viscosity of 3 substances
clear sub
sub{1}.id = get_id('CH4');
sub{2}.id = get_id('S2');
sub{3}.id = get_id('H2S');
sub{1}.x = 0.7;
sub{2}.x = 0.1;
sub{3}.x = 0.2;
env = get_env('T',173);
[u_mixture, out] = dynamic_viscosity(env,sub)