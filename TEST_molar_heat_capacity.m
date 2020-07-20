clear
clc
t = 50; % [deg C]
env = get_env('p',101325,'T',273.15+t);
%% Help molar heat capacity
help molar_heat_capacity
%% Molar heat capacity of one defined substance
sub{1}.id = get_id('CS2');
sub{1}.x = 1;
[cp_mixture, out] = molar_heat_capacity(env,sub)
%% Molar heat capacity of one defined substance - error molar fraction
clear sub
sub{1}.id = get_id('CH4');
sub{1}.x = 1.5;
[cp_mixture, out] = molar_heat_capacity(env,sub)
%% Molar heat capacity of 4 defined substances
sub{1}.id = get_id('methane');
sub{2}.id = get_id('CS2');
sub{3}.id = get_id('H2S');
sub{4}.id = get_id('S2');
sub{1}.x = 0.5;
sub{2}.x = 0.05;
sub{3}.x = 0.4;
sub{4}.x = 0.05;
sub = molar2weight_fraction(sub);
[cp_mixture, out] = molar_heat_capacity(env,sub)
out.sub{1}
out.sub{2}
out.sub{3}
out.sub{4}
%% Molar heat capacity of 4 substances through weight fractions

sub{1}.id = get_id('methane');
sub{2}.id = get_id('CS2');
sub{3}.id = get_id('H2S');
sub{4}.id = get_id('S2');
sub{1}.w = sub{1}.w;
sub{2}.w = sub{2}.w;
sub{3}.w = sub{3}.w;
sub{4}.w = sub{4}.w;
sub = weight2molar_fraction(sub);
[cp_mixture, out] = molar_heat_capacity(env,sub)
out.sub{1}
out.sub{2}
out.sub{3}
out.sub{4}
%% Molar heat capacity of 4 substances, but one is not defined
clear sub
sub{1}.id = get_id('S2');
sub{2}.id = get_id('ethane');
sub{3}.id = get_id('H2S');
sub{4}.id = get_id('CS2');
sub{1}.x = 0.5;
sub{2}.x = 0.05;
sub{3}.x = 0.4;
sub{4}.x = 0.05;
[cp_mixture, out] = molar_heat_capacity(env,sub)
%% Molar heat capacity of 4 substances, but 3 are not defined
clear sub
sub{1}.id = get_id('ethane');
sub{2}.id = get_id('H2SO4');
sub{3}.id = get_id('H2S');
sub{4}.id = get_id('das');
sub{1}.x = 0.5;
sub{2}.x = 0.05;
sub{3}.x = 0.4;
sub{4}.x = 0.05;
[cp_mixture, out] = molar_heat_capacity(env,sub)
%% Molar heat capacity of 1 substance
clear sub
sub{1}.id = get_id('H2S');
sub{1}.x = 1;
[cp_mixture, out] = molar_heat_capacity(env,sub)
%% Molar heat capacity of 1 non-defined substance
clear sub
sub{1}.id = get_id('H2Sdd');
sub{1}.x = 1;
[cp_mixture, out] = molar_heat_capacity(env,sub)
%% Molar heat capacity of 2 substances (1 is non-defined)
clear sub
sub{1}.id = get_id('as');
sub{1}.x = 0.5;
sub{2}.id = get_id('H2S');
sub{2}.x = 0.5;
[cp_mixture, out] = molar_heat_capacity(env,sub)
%% Molar heat capacity of 3 substances 
clear sub
sub{1}.id = get_id('CH4');
sub{1}.x = 0.5;
sub{2}.id = get_id('H2S');
sub{2}.x = 0.25;
sub{3}.id = get_id('CS2');
sub{3}.x = 0.25;
[cp_mixture, out] = molar_heat_capacity(env,sub)
%% Molar heat capacity of 5 substances 
clear sub
sub{1}.id = get_id('methane');
sub{1}.x = 0.5;
sub{2}.id = get_id('Ar');
sub{2}.x = 0.1;
sub{3}.id = get_id('CO2');
sub{3}.x = 0.1;
sub{4}.id = get_id('Br2');
sub{4}.x = 0.1;
sub{5}.id = get_id('Hg');
sub{5}.x = 0.2;
[cp_mixture, out] = molar_heat_capacity(env,sub)
%% Molar heat capacity of 4 subs
clear sub
sub{1}.id = get_id('N2');
sub{1}.x = 78.084;
sub{2}.id = get_id('S');
sub{2}.x = 20.946;
sub{3}.id = get_id('Ar');
sub{3}.x = 0.934;
sub{4}.id = get_id('COd2');
sub{4}.x = 0.033;
[cp_mixture, out] = molar_heat_capacity(env,sub)