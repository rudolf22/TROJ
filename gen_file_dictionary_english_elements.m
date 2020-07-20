function gen_file_dictionary_english_elements
[fid,info]=fopen('dictionary_english_elements.m','w');
update_table_of_elements();
table_of_elements = get_table_of_elements();

for id = 1:length(table_of_elements.Table.Row)
    name = table_of_elements.Table.Row(id).Cell{3};
    name1 = name(1);
    name2 = name(2:end);
    name3 = name1 + 32;
    name = [name3, name2];
    cmd = sprintf('dictionary.name{%d} = ''%s'';\n',id,name);
    fwrite(fid,cmd);
end
fclose(fid);
end
