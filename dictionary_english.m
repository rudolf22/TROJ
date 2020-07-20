function dictionary = dictionary_english

%% Language
dictionary.language = 'EN';

%% Name
% Elements
dictionary_english_elements
% Bimolecular elements
dictionary.name{201} = 'dihydrogen';
dictionary.name{207} = 'dinitrogen';
dictionary.name{208} = 'dioxygen';
dictionary.name{209} = 'difluorine';
dictionary.name{216} = 'disulfur';
dictionary.name{217} = 'dichlorine';
dictionary.name{235} = 'dibromine';
dictionary.name{253} = 'diiodine';
% Compounds
dictionary.name{300} = 'pentadecane';
dictionary.name{301} = 'methane';
% dictionary.name{302} = '';
dictionary.name{303} = 'carbon disulfide';
dictionary.name{304} = 'hydrogen sulfide';
dictionary.name{305} = 'methanoic acid';
dictionary.name{306} = 'ethanoic acid';
dictionary.name{307} = 'oxidan';
dictionary.name{308} = 'carbon dioxide';
%% Name Capitalized
% Elements_cap
dictionary_english_elements_cap
% Bimolecular elements_cap
dictionary.name_cap{201} = 'Dihydrogen';
dictionary.name_cap{207} = 'Dinitrogen';
dictionary.name_cap{208} = 'Dioxygen';
dictionary.name_cap{209} = 'Difluorine';
dictionary.name_cap{216} = 'Disulfur';
dictionary.name_cap{217} = 'Dichlorine';
dictionary.name_cap{235} = 'Dibromine';
dictionary.name_cap{253} = 'Diiodine';
% Compounds_cap
dictionary.name_cap{300} = 'Pentadecane';
dictionary.name_cap{301} = 'Methane';
% dictionary.name_cap{302} = '';
dictionary.name_cap{303} = 'Carbon Disulfide';
dictionary.name_cap{304} = 'Hydrogen Sulfide';
dictionary.name_cap{305} = 'Methanoic Acid';
dictionary.name_cap{306} = 'Ethanoic Acid';
dictionary.name_cap{307} = 'Oxidan';
dictionary.name_cap{308} = 'Carbon dioxide';
%% Trivial-Name
% Elements
dictionary_english_elements_trivial

dictionary.trivial_name{201} = 'dihydrogen';
dictionary.trivial_name{207} = 'dinitrogen';
dictionary.trivial_name{208} = 'dioxygen';
dictionary.trivial_name{209} = 'difluorine';
dictionary.trivial_name{216} = 'disulfur';
dictionary.trivial_name{217} = 'dichlorine';
dictionary.trivial_name{235} = 'dibromine';
dictionary.trivial_name{253} = 'diiodine';

dictionary.trivial_name{300} = 'pentadecane';
dictionary.trivial_name{301} = 'methane';
% dictionary.trivial_name{302} = '';
dictionary.trivial_name{303} = 'carbon bisulfide';
dictionary.trivial_name{304} = 'sulfane';
dictionary.trivial_name{305} = 'formic acid';
dictionary.trivial_name{306} = 'acetic acid';
dictionary.trivial_name{307} = 'water';
dictionary.trivial_name{308} = 'carbon dioxide';
%% Formula
% Elements
dictionary_english_elements_formula
% Bimolecular elements
dictionary.formula{201} = "H2";
dictionary.formula{207} = "N2";
dictionary.formula{208} = "O2";
dictionary.formula{209} = "F2";
dictionary.formula{216} = "S2";
dictionary.formula{217} = "Cl2";
dictionary.formula{235} = "Br2";
dictionary.formula{253} = "I2";
% Compounds
dictionary.formula{300} = "C15H32";
dictionary.formula{301} = "CH4";
% dictionary.formula{302} = "";
dictionary.formula{303} = "CS2";
dictionary.formula{304} = "H2S";
dictionary.formula{305} = "HCOOH";
dictionary.formula{306} = "CH3COOH";
dictionary.formula{307} = "H2O";
dictionary.formula{308} = "CO2";
%% ID
dictionary.id = [];
for k = 1 : length(dictionary.name)
    if( isempty( dictionary.name{k} ) == 0 )
        dictionary.id = [dictionary.id, k];
    end
end

%% Message 
% Info
dictionary.message.info{1} = 'No problem detected.';
dictionary.message.info{2} = 'Problem detected!';
dictionary.message.info{3} = 'Something was ignored or not found!';
dictionary.message.info{4} = 'ID';
dictionary.message.info{5} = 'Name of sub';
dictionary.message.info{6} = 'Trivial name of sub';
dictionary.message.info{7} = 'Chemical formula of sub';
% Problem
dictionary.message.problem{1} = '%s: Substance %s not found!';
dictionary.message.problem{2} = '%s: Substance %s ignored!';
dictionary.message.problem{3} = '%s: Substance %s has non-consistent molar fraction!';
dictionary.message.problem{4} = '%s: Warning: Molar fractions were normalized to 1.';
dictionary.message.problem{5} = '%s: Substance %s has non-consistent weight fraction!';
dictionary.message.problem{6} = '%s: Warning: Weight fractions were normalized to 1.';
dictionary.message.problem{7} = '%s: Warning: Inhomogeneous mixture !';
dictionary.message.problem{8} = '%s: Warning: Non-evaluated !';
dictionary.message.problem{9} = '%s: Substance %s is not an element !';
% Error
dictionary.message.error{1} = 'Pressure is just a number, not a vector or matrix !\n';
dictionary.message.error{2} = 'Temperature is just a number, not a vector or matrix !\n';
dictionary.message.error{3} = 'Temperature has to be greater than 0 K !\n';
dictionary.message.error{4} = 'Temperature has to be less than 6000 K !\n';
dictionary.message.error{5} = 'Pressure has to be nonnegative number !\n';
% 2 Errors
dictionary.message.error{6} = 'Pressure is just a number, not a vector or matrix !\nTemperature is just a number, not a vector or matrix !\n';
dictionary.message.error{7} = 'Pressure has to be nonnegative number !\nTemperature has to be greater than 0 K !\n';
dictionary.message.error{8} = 'Pressure has to be nonnegative number !\nTemperature has to be less than 6000 K !\n';
end