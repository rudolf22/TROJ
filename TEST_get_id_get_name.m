clear
clc
%% Helps of get_id, get_name
help get_id
help get_name
% all substances are defined on basis of ID (only elements)
sub{1}.id = get_id(1);
sub{2}.id = get_id(46);
sub{3}.id = get_id(72);
sub{4}.id = get_id(83);
% all substances are defined on basis of name (only elements)
sub{5}.id = get_id('hydrogen');
sub{6}.id = get_id('palladium');
sub{7}.id = get_id('hafnium');
sub{8}.id = get_id('bismuth');
% all substances are defined on basis of formula (symbol) (only elements)
sub{9}.id = get_id('H');
sub{10}.id = get_id('Pd');
sub{11}.id = get_id('Hf');
sub{12}.id = get_id('Bi');
% all substances are defined on basis of ID (only external substances)
sub{13}.id = get_id(301);
sub{14}.id = get_id(303);
sub{15}.id = get_id(304);
sub{16}.id = get_id(308);
% all substances are defined on basis of name (only external substances)
sub{17}.id = get_id('methane');
sub{18}.id = get_id('carbon disulfide');
sub{19}.id = get_id('hydrogen sulfide');
sub{20}.id = get_id('carbon dioxide');
% all substances are defined on basis of formula (only external substances)
sub{21}.id = get_id('CH4');
sub{22}.id = get_id('CS2');
sub{23}.id = get_id('H2S');
sub{24}.id = get_id('CO2');
% all substances are defined on basis of name, formula (elements and also external substances)
sub{25}.id = get_id('H2O');
sub{26}.id = get_id('chlorine');
sub{27}.id = get_id('dinitrogen');
sub{28}.id = get_id('HCOOH');
sub{29}.id = get_id('O2');
sub{30}.id = get_id('Es');
%% INF
% some substances are not defined on basis of ID
sub{31}.id = get_id(0);
sub{32}.id = get_id(210);
sub{33}.id = get_id(300); % defined
sub{34}.id = get_id(119);
% some substances are not defined on basis of name
sub{35}.id = get_id('Hsda');
sub{36}.id = get_id('ethane');
sub{37}.id = get_id('paladium'); % error in correct name of sub.
sub{38}.id = get_id('aa');
% some substances are not defined on basis of formula
sub{39}.id = get_id('HCOOHH');
sub{40}.id = get_id('C2H6');
sub{41}.id = get_id('Pa'); % defined
sub{42}.id = get_id('Mda');
set_ops('name','name');
for k = 1:308
    id = get_id(get_name(k));
    disp(sprintf('Name: %s, ID: %d ',get_name(k),id))
end
for k = 1:length(sub)
    set_ops('name','name');
    name = get_name(sub{k}.id);
    disp(sprintf('ID: %d, Name: %s ',sub{k}.id,name))
    set_ops('name','formula');
    name = get_name(sub{k}.id);
    disp(sprintf('ID: %d, Name: %s ',sub{k}.id,name))
    set_ops('name','id');
    name = get_name(sub{k}.id);
    disp(sprintf('ID: %d, Name: %s ',sub{k}.id,name))
end
for k = 1:308
    set_ops('name','name');
    name = get_name(k);
    disp(sprintf('ID: %d, Name: %s ',k,name))
    set_ops('name','formula');
    name = get_name(k);
    disp(sprintf('ID: %d, Name: %s ',k,name))
    set_ops('name','id');
    name = get_name(k);
    disp(sprintf('ID: %d, Name: %s ',k,name))
end