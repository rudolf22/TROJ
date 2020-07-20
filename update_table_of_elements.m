function update_table_of_elements()    
%% UPDATE_TABLE_OF_ELEMENTS
%
%   The function update_table_of_elements updates and save data
%   of chemical properties for elements.
%  
%   The updated/initialized data is saved in global variable table_of_elements. 
%
%   SEE ALSO: UPDATE_TABLE_OF_CRITICAL_TEMPERATURE_ELEMENT, UPDATE_TABLE_OF_MOLAR_MASS, UPDATE_TABLE_OF_TEMPERATURES.
%
%   LAST UPDATE: 2020-04-26.
%
global table_of_elements
obj = urlread('https://pubchem.ncbi.nlm.nih.gov/rest/pug/periodictable/JSON/?response_type=save&response_basename=PubChemElements_all');
table_of_elements = jsondecode(obj);
end