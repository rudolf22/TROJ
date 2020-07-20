clear
clc
%% Help critical temperature for more elements or substances
help critical_temperature
%% Critical temperature for elements (all defined elements)
sub{1}.id = get_id('Pd');
sub{2}.id = get_id('Bi');
sub{3}.id = get_id('Rn');
sub{4}.id = get_id('Hg');
[Tc,out] = critical_temperature(sub)
%% Critical temperature for elements (not all defined elements)
sub{1}.id = get_id('Pd');
sub{2}.id = get_id('Bidggfs');
sub{3}.id = get_id('methane');
sub{4}.id = get_id('Hg');
[Tc,out] = critical_temperature(sub)
%% Critical temperature for elements (all defined substances/elements)
sub{1}.id = get_id('methane');
sub{2}.id = get_id('N2');
sub{3}.id = get_id('dioxygen');
sub{4}.id = get_id('CS2');
[Tc,out] = critical_temperature(sub)
%% Critical temperature for elements (all defined substances/elements)
sub{1}.id = get_id('CH4');
sub{2}.id = get_id('water');
sub{3}.id = get_id('H2O');
sub{4}.id = get_id('CS2');
[Tc,out] = critical_temperature(sub)