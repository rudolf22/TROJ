function id = get_id(name)
%% GET_ID
%
%   Function get_id returns identification number of chosen substance.
%
%   Syntax:
%   id = get_id(name)
%   where:
%   name(class:string or double) - input parameter: name, formula or identification number of substance,
%   id(class:double) - output parameter: identification number of substances (for elements ID is atomic number).
%
%   Example:
%   name = 'methane';
%   id = get_id(name)
%
%   id = 301
%
%   SEE ALSO: GET_NAME, GET_SUB, GET_SUBS.
%
%   LAST UPDATE: 2020-04-26.
%
ops = get_ops();
dictionary = get_dictionary(ops.language); % Call dictionary

for k = dictionary.id
%% Search in my Table of Compounds
    if ((isequal(name, k )) | (isequal(name, dictionary.name{k})) | (isequal(name, dictionary.name_cap{k})) | (isequal(name, dictionary.trivial_name{k})) | (isequal(name, dictionary.formula{k})))
        id = k;
        return
    end
end
 
if (exist('id') == 0)
    id = Inf; % Philosophers stone
end


end % function