function dictionary = dictionary_slovak

%% Language
dictionary.language = 'SK';

%% Name
% Elements
dictionary_slovak_elements
% Bimolecular elements
dictionary.name{201} = 'divodik';
dictionary.name{207} = 'didusik';
dictionary.name{208} = 'dikyslik';
dictionary.name{209} = 'difluor';
dictionary.name{216} = 'disira';
dictionary.name{217} = 'dichlor';
dictionary.name{235} = 'dibrom';
dictionary.name{253} = 'dijod';
% Compounds
dictionary.name{300} = 'pentadekan';
dictionary.name{301} = 'metan';
% dictionary.name{302} = '';
dictionary.name{303} = 'sulfid uhlicity';
dictionary.name{304} = 'sulfan';
dictionary.name{305} = 'kyselina metanova';
dictionary.name{306} = 'kyselina etanova';
dictionary.name{307} = 'oxidan';
dictionary.name{308} = 'oxid uhlicity';
%% Name Capitalized
% Elements_cap
dictionary_slovak_elements_cap
% Bimolecular elements_cap
dictionary.name_cap{201} = 'Divodik';
dictionary.name_cap{207} = 'Didusik';
dictionary.name_cap{208} = 'Dikyslik';
dictionary.name_cap{209} = 'Difluor';
dictionary.name_cap{216} = 'Disira';
dictionary.name_cap{217} = 'Dichlor';
dictionary.name_cap{235} = 'Dibrom';
dictionary.name_cap{253} = 'Dijod';
% Compounds_cap
dictionary.name_cap{300} = 'Pentadekan';
dictionary.name_cap{301} = 'Metan';
% dictionary.name_cap{302} = '';
dictionary.name_cap{303} = 'Sulfid uhlicity';
dictionary.name_cap{304} = 'Sulfan';
dictionary.name_cap{305} = 'Kyselina metanova';
dictionary.name_cap{306} = 'Kyselina etanova';
dictionary.name_cap{307} = 'Oxidan';
dictionary.name_cap{308} = 'Oxid uhlicity';
%% Trivial-Name
% Elements
dictionary_slovak_elements_trivial
% Bimolecular elements
dictionary.trivial_name{201} = 'divodik';
dictionary.trivial_name{207} = 'didusik';
dictionary.trivial_name{208} = 'dikyslik';
dictionary.trivial_name{209} = 'difluor';
dictionary.trivial_name{216} = 'disira';
dictionary.trivial_name{217} = 'dichlor';
dictionary.trivial_name{235} = 'dibrom';
dictionary.trivial_name{253} = 'dijod';
% Compounds
dictionary.trivial_name{300} = 'pentadekan';
dictionary.trivial_name{301} = 'metan';
% dictionary.trivial_name{302} = '';
dictionary.trivial_name{303} = 'sirouhlik';
dictionary.trivial_name{304} = 'sirovodik';
dictionary.trivial_name{305} = 'kyselina mravcia';
dictionary.trivial_name{306} = 'kyselina octova';
dictionary.trivial_name{307} = 'voda';
dictionary.trivial_name{308} = 'oxid uhlicity';
%% Formula
% Elements
dictionary_slovak_elements_formula
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
dictionary.message.info{1} = 'Nespozorovany ziadny problem.';
dictionary.message.info{2} = 'Spozorovany problem !';
dictionary.message.info{3} = 'Nieco bolo zanedbane alebo nenajdene !';
dictionary.message.info{4} = 'ID';
dictionary.message.info{5} = 'Nazov latky';
dictionary.message.info{6} = 'Trivialny nazov latky';
dictionary.message.info{7} = 'Chemicky vzorec latky';
% Problem
dictionary.message.problem{1} = '%s: Latka %s nebola najdena !';
dictionary.message.problem{2} = '%s: Latka %s bola ignorovana !';
dictionary.message.problem{3} = '%s: Latka %s ma nekonzistentny molovy zlomok !';
dictionary.message.problem{4} = '%s: Upozornenie: Molove zlomky boli normalizovane do 1.';
dictionary.message.problem{5} = '%s: Latka %s ma nekonzistentny hmotnostny zlomok !';
dictionary.message.problem{6} = '%s: Upozornenie: Hmotnostne zlomky boli normalizovane do 1.';
dictionary.message.problem{7} = '%s: Upozornenie: Nehomogenna zmes !';
dictionary.message.problem{8} = '%s: Upozornenie: Nerealizovatelny vypocet !';
dictionary.message.problem{9} = '%s: Latka %s nie je prvkom periodickej sustavy prvkov !';
% Error
dictionary.message.error{1} = 'Tlak musi byt cislo a nie vektor alebo matica !\n';
dictionary.message.error{2} = 'Teplota musi byt cislo a nie vektor alebo matica !\n';
dictionary.message.error{3} = 'Teplota musi byt vacsia ako 0 K !\n';
dictionary.message.error{4} = 'Teplota musi byt mensia ako 6000 K !\n';
dictionary.message.error{5} = 'Tlak musi byt nezaporne cislo !\n';
% 2 Errors
dictionary.message.error{6} = 'Tlak musi byt cislo a nie vektor alebo matica !\nTeplota musi byt cislo a nie vektor alebo matica !\n';
dictionary.message.error{7} = 'Tlak musi byt nezaporne cislo !\nTeplota musi byt vacsia ako 0 K !\n';
dictionary.message.error{8} = 'Tlak musi byt nezaporne cislo !\nTeplota musi byt mensia ako 6000 K !\n';
end