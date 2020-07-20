function dictionary = dictionary_german

%% Language
dictionary.language = 'DE';

%% Name
% Elements
dictionary_german_elements
% Bimolecular elements
dictionary.name{201} = 'diwasserstoff';
dictionary.name{207} = 'distickstoff';
dictionary.name{208} = 'disauerstoff';
dictionary.name{209} = 'difluor';
dictionary.name{216} = 'dischwefel';
dictionary.name{217} = 'dichlor';
dictionary.name{235} = 'dibrom';
dictionary.name{253} = 'diiod';
% Compounds
dictionary.name{300} = 'pentadekan';
dictionary.name{301} = 'methan';
% dictionary.name{302} = '';
dictionary.name{303} = 'schwefelkohlenstoff';
dictionary.name{304} = 'schwefelwasserstoff';
dictionary.name{305} = 'methansaeure';
dictionary.name{306} = 'ethansaeure';
dictionary.name{307} = 'oxidan';
dictionary.name{308} = 'kohlenstoffdioxid';

%% Name Capitalized
% Elements_cap
dictionary_german_elements_cap
% Bimolecular elements_cap
dictionary.name_cap{201} = 'Diwasserstoff';
dictionary.name_cap{207} = 'Distickstoff';
dictionary.name_cap{208} = 'Disauerstoff';
dictionary.name_cap{209} = 'Difluor';
dictionary.name_cap{216} = 'Dischwefel';
dictionary.name_cap{217} = 'Dichlor';
dictionary.name_cap{235} = 'Dibrom';
dictionary.name_cap{253} = 'Diiod';
% Compounds
dictionary.name_cap{300} = 'Pentadekan';
dictionary.name_cap{301} = 'Methan';
% dictionary.name_cap{302} = '';
dictionary.name_cap{303} = 'Schwefelkohlenstoff';
dictionary.name_cap{304} = 'Schwefelwasserstoff';
dictionary.name_cap{305} = 'Methansaeure';
dictionary.name_cap{306} = 'Ethansaeure';
dictionary.name_cap{307} = 'Oxidan';
dictionary.name_cap{308} = 'Kohlenstoffdioxid';
%% Trivial-Name
% Elements
dictionary_german_elements_trivial
% Bimolecular elements
dictionary.trivial_name{201} = 'diwasserstoff';
dictionary.trivial_name{207} = 'distickstoff';
dictionary.trivial_name{208} = 'disauerstoff';
dictionary.trivial_name{209} = 'difluor';
dictionary.trivial_name{216} = 'dischwefel';
dictionary.trivial_name{217} = 'dichlor';
dictionary.trivial_name{235} = 'dibrom';
dictionary.trivial_name{253} = 'diiod';
% Compounds
dictionary.trivial_name{300} = 'pentadekan';
dictionary.trivial_name{301} = 'methan';
% dictionary.trivial_name{302} = '';
dictionary.trivial_name{303} = 'kohlendisulfid';
dictionary.trivial_name{304} = 'netzschwefel';
dictionary.trivial_name{305} = 'ameisensaeure';
dictionary.trivial_name{306} = 'essigsaeure';
dictionary.trivial_name{307} = 'oxidan';
dictionary.trivial_name{308} = 'kohlendioxid';
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
dictionary.message.info{1} = 'Kein Problem.';
dictionary.message.info{2} = 'Ein Problem entdeckt !';
dictionary.message.info{3} = 'Etwas wurde vernachlässigt oder nicht gefunden !';
dictionary.message.info{4} = 'ID';
dictionary.message.info{5} = 'Name des Stoffes';
dictionary.message.info{6} = 'Trivial-Name des Stoffes';
dictionary.message.info{7} = 'Chemische Formel des Stoffes';
% Problem
dictionary.message.problem{1} = '%s: Substanz %s nicht gefunden!';
dictionary.message.problem{2} = '%s: Substanz %s wurde ignoriert!';
dictionary.message.problem{3} = '%s: Substanz %s hat inkonsistenter Molenbruch.';
dictionary.message.problem{4} = '%s: Warnung: Die Molenbrueche wurden auf 1 normiert.';
dictionary.message.problem{5} = '%s: Substanz %s hat inkonsistenter Massenanteil !';
dictionary.message.problem{6} = '%s: Warnung: Die Massenanteile wurden auf 1 normiert.';
dictionary.message.problem{7} = '%s: Warnung: Die heterogene Mischung !';
dictionary.message.problem{8} = '%s: Warnung: Die Rechnung ist nicht ausfuehrbar !';
dictionary.message.problem{9} = '%s: Substanz %s ist nicht chemischer Grundstoff !';
% Error
dictionary.message.error{1} = 'Der Andruck muss eine Zahl sein, der Vektor oder die Matrix sind nicht subventioniert !\n';
dictionary.message.error{2} = 'Die Temperatur muss eine Zahl sein, der Vektor oder die Matrix sind nicht subventioniert !\n';
dictionary.message.error{3} = 'Die Temperatur muss groesser als 0 K sein !\n';
dictionary.message.error{4} = 'Die Temperatur muss kleiner als 6000 K sein !\n';
dictionary.message.error{5} = 'Der Andruck muss nichtnegative Zahl sein !\n';
% 2 Errors
dictionary.message.error{6} = 'Der Andruck muss eine Zahl sein, der Vektor oder die Matrix sind nicht subventioniert !\nDie Temperatur muss eine Zahl sein, der Vektor oder die Matrix sind nicht subventioniert !\n';
dictionary.message.error{7} = 'Der Andruck muss nichtnegative Zahl sein !\nDie Temperatur muss groesser als 0 K sein !\n';
dictionary.message.error{8} = 'Der Andruck muss nichtnegative Zahl sein !\nDie Temperatur muss kleiner als 6000 K sein !\n';
end