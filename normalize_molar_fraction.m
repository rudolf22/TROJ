function [sub_normalized,out] = normalize_molar_fraction(sub)
%% NORMALIZE_MOLAR_FRACTION
%
%   The function normalize_molar_fraction returns value of molar fraction of defined substance or substances after normalizing.
%   This function can work with the ratio of substances and then it is evaulated from the ratio to molar fractions.   
%
%   Syntax:
%   [sub_normalized,out] = normalize_molar_fraction(sub)
%   where:
%              sub(class:cell) - input which contains struct with two fields,
%                                identification number of that substance and molar fraction,
%   sub_normalized(class:cell) - output which contains struct with also two
%                                fields, where the first is the same identification number and the
%                                second is normalized molar fraction of that substance,
%            out(class:struct) - output information, which contains:                             
%                                - flag - parameter of reliability,
%                                - info - short information about correctness of result,
%                                - ver  - date of the latest update of program in form YYYY-MM-DD,
%                                - sub  - properties of substances.
%
%   Example:
%   sub{1}.id = 301;                                        
%   sub{1}.x = 0.5;
%   [sub_normalized,out] = normalize_molar_fraction(sub)
%
%   normalize_molar_fraction: Substance methane has non-consistent molar fraction!
%   normalize_molar_fraction: Warning: Molar fractions were normalized to 1.
%
%   sub_normalized =
%        1×1 cell array
%          {1×1 struct}
%   out = 
%   struct with fields:
%    flag: 1
%    info: 'No problem detected.'
%     ver: 20200412
%     sub: {[1×1 struct]}
%
%   >> out.sub{1}
%   ans = 
%     struct with fields:
%       id: 301
%        x: 1
%
%   SEE ALSO: NORMALIZE_WEIGHT_FRACTION, MOLAR2WEIGHT_FRACTION, WEIGHT2MOLAR_FRACTION.
%
%   LAST UPDATE: 2020-04-26.
%
flag=0;
sub_normalized = sub;
sum_x = 0;

for k = 1 : length(sub)
    sum_x = sum_x + sub{k}.x;
end
ops = get_ops; % Call options
dictionary = get_dictionary(ops.language); % Call dictionary
for k = 1 : length(sub)
    if( sub_normalized{k}.x ~= ( sub{k}.x )/sum_x )
        disp(sprintf(dictionary.message.problem{3},mfilename,get_name(sub{k}.id))); %Substance ID=%d has non-consistent molar fraction!
        disp(sprintf(dictionary.message.problem{4},mfilename)); %Warning: Molar fractions were normalized to 1.
    end
    if ((length(sub) == 1) & (sub{k}.x == 0))
        sub_normalized{k}.x = 1;
    else
        sub_normalized{k}.x = ( sub{k}.x )/sum_x;
    end
end
flag=1;
out.flag=flag;
if flag==1
    out.info = 'No problem detected.';
else 
    out.info = 'Process is not being done !';
end
out.ver = ops.version;
out.sub = sub;
end
