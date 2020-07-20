function name_non_defined = get_name_non_defined(name)
ops = get_ops();
dictionary = get_dictionary(ops.language); % Call dictionary

for k = dictionary.id
%% Search in my Table of Compounds
    if ((isequal(name, k )) | (isequal(name, dictionary.name{k})) | (isequal(name, dictionary.name_cap{k})) | (isequal(name, dictionary.trivial_name{k})) | (isequal(name, dictionary.formula{k})))
        name_non_defined = 'defined';
        return
    else
        name_non_defined = name;
        
    end
end


end % function
