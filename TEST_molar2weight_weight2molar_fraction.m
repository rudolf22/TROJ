clear
clc
%% Helps of molar2weight and weight2molar fractions
help molar2weight_fraction
help weight2molar_fraction
%% Molar2weight fraction (2 subs)
sub{1}.id = get_id('methane');
sub{1}.x = 0.80;
sub{2}.id = get_id('hydrogen sulfide');
sub{2}.x = 0.20;
[sub,out] = molar2weight_fraction(sub)
sub{1}
sub{2}
%% Weight2Molar fraction (2 subs)
clear sub
sub{1}.id = get_id('methane');
sub{1}.w = 0.6531;
sub{2}.id = get_id('hydrogen sulfide');
sub{2}.w = 0.3469;
[sub,out] = weight2molar_fraction(sub)
sub{1}
sub{2}
%% Molar2weight fraction (3 subs)
clear sub
sub{1}.id = get_id('methane');
sub{1}.x = 0.6;
sub{2}.id = get_id('hydrogen sulfide');
sub{2}.x = 0.2;
sub{3}.id = get_id('N2');
sub{3}.x = 0.2;
[sub,out] = molar2weight_fraction(sub)
sub{1}
sub{2}
sub{3}
%% Weight2Molar fraction (3 subs)
clear sub
sub{1}.id = get_id('methane');
sub{1}.w = 0.4366;
sub{2}.id = get_id('hydrogen sulfide');
sub{2}.w = 0.3092;
sub{3}.id = get_id('N2');
sub{3}.w = 0.2541;
[sub,out] = weight2molar_fraction(sub)
sub{1}
sub{2}
sub{3}
%% Molar2weight fraction (3 subs, 1 sub not defined)
clear sub
sub{1}.id = get_id('ethane');
sub{1}.x = 0.6;
sub{2}.id = get_id('hydrogen sulfide');
sub{2}.x = 0.2;
sub{3}.id = get_id('N2');
sub{3}.x = 0.2;
[sub,out] = molar2weight_fraction(sub)
sub{1}
sub{2}
sub{3}
%% Weight2Molar fraction (3 subs, 1 sub not defined)
clear sub
sub{1}.id = get_id('ethane');
sub{1}.w = 0.4366;
sub{2}.id = get_id('hydrogen sulfide');
sub{2}.w = 0.3092;
sub{3}.id = get_id('N2');
sub{3}.w = 0.2541;
[sub,out] = weight2molar_fraction(sub)
sub{1}
sub{2}
sub{3}
%% Molar2weight fraction of air with 1 undefined sub (N2O)
sub{1}.id=get_id('N2');
sub{2}.id=get_id('O2');
sub{3}.id=get_id('Ar');
sub{4}.id=get_id('CO2');
sub{5}.id=get_id('Ne');
sub{6}.id=get_id('He');
sub{7}.id=get_id('CH4');
sub{8}.id=get_id('Kr');
sub{9}.id=get_id('N2O');
sub{10}.id=get_id('H2');
sub{11}.id=get_id('Xe');
sub{1}.x=78.084;
sub{2}.x=20.946;
sub{3}.x=0.934;
sub{4}.x=0.033;
sub{5}.x=0.001818;
sub{6}.x=0.000524;
sub{7}.x=0.0002;
sub{8}.x=0.000114;
sub{9}.x=0.00005;
sub{10}.x=0.00005;
sub{11}.x=0.0000087;
sub_weight = molar2weight_fraction(sub);
sub_weight{:}