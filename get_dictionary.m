function dictionary = get_dictionary(language)

if (isequal(language,'SK'))
    dictionary = dictionary_slovak;
elseif (isequal(language,'DE'))
    dictionary = dictionary_german; 
else
    dictionary = dictionary_english; % Default Language
end


end