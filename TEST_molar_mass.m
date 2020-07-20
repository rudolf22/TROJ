clear
clc
%% Help of molar_mass
help molar_mass
%% Molar mass of one defined substance
sub{1}.id = get_id('CH4');
sub{1}.x = 1;
[M_methane,out] = molar_mass(sub)
%% Molar mass of one defined substance - error molar fraction
clear sub
sub{1}.id = get_id('CH4');
sub{1}.x = 1.5;
[M_methane,out] = molar_mass(sub)
%% Molar mass of 4 defined substances
sub{1}.id = get_id('methane');
sub{2}.id = get_id('S2');
sub{3}.id = get_id('H2S');
sub{4}.id = get_id('CS2');
sub{1}.x = 0.5;
sub{2}.x = 0.05;
sub{3}.x = 0.4;
sub{4}.x = 0.05;
sub = molar2weight_fraction(sub);
[M_mixture,out] = molar_mass(sub)
out.sub{1}
out.sub{2}
out.sub{3}
out.sub{4}
%% Molar mass of 4 substances through weight fractions

sub{1}.id = get_id('methane');
sub{2}.id = get_id('S2');
sub{3}.id = get_id('H2S');
sub{4}.id = get_id('CS2');
sub{1}.w = sub{1}.w;
sub{2}.w = sub{2}.w;
sub{3}.w = sub{3}.w;
sub{4}.w = sub{4}.w;
sub = weight2molar_fraction(sub);
[M_mixture,out] = molar_mass(sub)
out.sub{1}
out.sub{2}
out.sub{3}
out.sub{4}
%% Molar mass of 4 substances, but one is not defined
clear sub
sub{1}.id = get_id('ethane');
sub{2}.id = get_id('S2');
sub{3}.id = get_id('H2S');
sub{4}.id = get_id('CS2');
sub{1}.x = 0.5;
sub{2}.x = 0.05;
sub{3}.x = 0.4;
sub{4}.x = 0.05;
[M_mixture,out] = molar_mass(sub)
%% Molar mass of 4 substances, but 3 are not defined
sub{1}.id = get_id('ethane');
sub{2}.id = get_id('H2SO4');
sub{3}.id = get_id('H2S');
sub{4}.id = get_id('das');
sub{1}.x = 0.5;
sub{2}.x = 0.05;
sub{3}.x = 0.4;
sub{4}.x = 0.05;
[M_mixture,out] = molar_mass(sub)