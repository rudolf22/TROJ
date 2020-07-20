function gen_file_dictionary_german_elements_cap
[fid,info]=fopen('dictionary_german_elements_cap.m','w');
dictionary_german_elements

for id = 1:length(dictionary.name)
    name = dictionary.name{id};
    name1 = name(1);
    name2 = name(2:end);
    name3 = name1 - 32;
    name = [name3, name2];
    cmd = sprintf('dictionary.name_cap{%d} = ''%s'';\n',id,name);
    fwrite(fid,cmd);
end
fclose(fid);
end
