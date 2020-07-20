function sub = get_subs(varargin)
%% GET_SUBS
%
%   The function returns identification numbers and molar fractions of defined substances.
%   It is enhanced function of function GET_SUB, because this function works with blends.
%   
%   Syntax:
%   sub = get_subs(get_sub('name','A'),get_sub('name','B'),...)
%   sub = get_subs(get_sub('meno','A'),get_sub('meno','B'),...)
%
%   A,B(class:string) - inputs, they can be name in english/slovak language and formula of
%   defined substance in blend
%   sub(class:cell) - cells contain two or more structs with always two fields, the first is id. number and
%   the second is default molar fraction of each defined substance in blend
%   Default molar fraction for each substance x = 1.
%
%   Expanded syntax:
%   sub = get_subs(get_sub('name','A','x',X,'phase','P'),get_sub('name','B','x',Y,'phase','P'))
%   sub = get_subs(get_sub('meno','A','x',X,'faza','P'),get_sub('meno','B','x',Y,'faza','P'))
%
%   A,B(class:string) - inputs, they can be names in english/slovak language and formulas of
%   defined substances in blend
%   X,Y(class:double) - value of molar fractions of defined substances from 0 to 1
%   sub(class:cell) - cells contain two or more structs with always two or three fields, the first is id. number and
%   the second is default molar fraction of each defined substance in blend
%   the third is P - phase of substance, P = g/l/s   
%
%   Example:
%   sub = get_subs(get_sub('name','CH4', 'x',1),...
%            get_sub('name','HCOOH', 'x',1))    
%    
%   sub =
%   1×2 cell array
%   {1×1 struct}    {1×1 struct}
%
%   >> sub{1}
%   ans = 
%   struct with fields:
%     id: 301
%      x: 1
%
%   >> sub{2}
%   ans = 
%   struct with fields:
%     id: 305
%      x: 1
%
%   SEE ALSO: GET_SUB, GET_ID, GET_NAME.
%
%   LAST UPDATE: 2020-04-26.
%
for k = 1 : nargin
   sub(k) = varargin{k};
end

end