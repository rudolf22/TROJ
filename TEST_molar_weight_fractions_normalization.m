clear
clc
set_ops('name','name');
%% Helps of normalize of molar and weight fractions
help normalize_molar_fraction
help normalize_weight_fraction
%% Normalization of Molar fractions
sub{1}.id = get_id('methane');
sub{1}.x = 0.77;
[sub_normalized,out] = normalize_molar_fraction(sub)
sub_normalized{1}

% 2 substances with percentages
clear sub
sub{1}.id = get_id('methane');
sub{1}.x = 80;
sub{2}.id = get_id('hydrogen sulfide');
sub{2}.x = 20;
[sub_normalized,out] = normalize_molar_fraction(sub)
sub_normalized{1}
sub_normalized{2}
%% Normalization of Weight fractions
clear sub
sub{1}.id = get_id('methane');
sub{1}.w = 0.77;
[sub_normalized,out] = normalize_weight_fraction(sub)
sub_normalized{1}

% 2 substances with percentages
clear sub
sub{1}.id = get_id('methane');
sub{1}.w = 80;
sub{2}.id = get_id('hydrogen sulfide');
sub{2}.w = 20;
[sub_normalized,out] = normalize_weight_fraction(sub)
sub_normalized{1}
sub_normalized{2}
%% Normalization of Molar fractions (1 sub not defined)
% 2 substances with percentages
clear sub
sub{1}.id = get_id('ethane');
sub{1}.x = 80;
sub{2}.id = get_id('hydrogen sulfide');
sub{2}.x = 20;
[sub_normalized,out] = normalize_molar_fraction(sub)
sub_normalized{1}
sub_normalized{2}
%% Normalization of Weight fractions (1 sub not defined)
% 2 substances with percentages
clear sub
sub{1}.id = get_id('ethane');
sub{1}.w = 80;
sub{2}.id = get_id('hydrogen sulfide');
sub{2}.w = 20;
[sub_normalized,out] = normalize_weight_fraction(sub)
sub_normalized{1}
sub_normalized{2}