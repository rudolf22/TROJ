function gen_file_dictionary_slovak_elements_formula
[fid,info]=fopen('dictionary_slovak_elements_formula.m','w');
update_table_of_elements();
table_of_elements = get_table_of_elements();

for id = 1:length(table_of_elements.Table.Row)
    name = table_of_elements.Table.Row(id).Cell{2};
    cmd = sprintf('dictionary.formula{%d} = "%s";\n',id,name);
    fwrite(fid,cmd);
end
fclose(fid);
end