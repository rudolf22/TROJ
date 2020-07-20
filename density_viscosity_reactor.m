%-- 27.5.20 17:51 --%
sub{1}.id = get_id('CH4');
sub{2}.id = get_id('S2');
sub{3}.id = get_id('CS2');
sub{4}.id = get_id('H2S');
index = find(T>=970,1);
sub{1}.x = F_CH4(index)/F(index);
sub{2}.x = F_S2(index)/F(index);
sub{3}.x = F_CS2(index)/F(index);
sub{4}.x = F_H2S(index)/F(index);
env = get_env('p',101325,'T',970);
[rho_mix,out] = density(env,sub)
[u_mix,out] = dynamic_viscosity(env,sub)

%-- 27.5.20 17:51 --%
sub{1}.id = get_id('CH4');
sub{2}.id = get_id('S2');
sub{3}.id = get_id('CS2');
sub{4}.id = get_id('H2S');

sub{1}.x = F_CH4(end)/F(end);
sub{2}.x = F_S2(end)/F(end);
sub{3}.x = F_CS2(end)/F(end);
sub{4}.x = F_H2S(end)/F(end);
env = get_env('p',101325,'T',T(end));
[rho_mix,out] = density(env,sub)
[u_mix,out] = dynamic_viscosity(env,sub)