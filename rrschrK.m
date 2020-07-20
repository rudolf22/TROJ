


commandwindow
env = get_env('T',970);
sub{1}.id = get_id('CH4');
sub{1}.x = 1;
sub{2}.id = get_id('S2');
sub{2}.x = 1;
sub{3}.id = get_id('CS2');
sub{3}.x = 1;
sub{4}.id = get_id('H2S');
sub{4}.x = 1;
[rH,out] = reaction_enthalpy(env)
[Cp_CH4,out1] = molar_heat_capacity(env,sub(1))
[Cp_S2,out2] = molar_heat_capacity(env,sub(2))
[Cp_CS2,out3] = molar_heat_capacity(env,sub(3))
[Cp_H2S,out4] = molar_heat_capacity(env,sub(4))
ni=[-1 -2 1 2];
Tf=950; %[K]
Pf=101.325; %[kPa]
Ff=[5 50 0 0]; %[mol.h^(-1)]
R=8.314; %[J.mol^(-1).K^(-1)]
[Vr,X]=ode15s(@reaktor,[0 100],[Ff Tf],[],ni,Tf,Pf,R,Ff,rH,Cp_CH4,Cp_S2,Cp_CS2,Cp_H2S);
F_CH4 = X(:,1);
F_S2 = X(:,2);
F_CS2 = X(:,3);
F_H2S = X(:,4);
F = F_CH4 + F_S2 + F_CS2 + F_H2S;
x_CH4 = F_CH4./F;
x_S2 = F_S2./F;
x_CS2 = F_CS2./F;
x_H2S = F_H2S./F;
T = X(:,5);
V=(F.*R.*T)./Pf;
C_CH4=(F_CH4./V)*1000;
C_S2=(F_S2./V)*1000;
C_CS2=(F_CS2./V)*1000;
C_H2S=(F_H2S./V)*1000;

d = 0.05; %[m]
z = (4*Vr.*1e-3)./(pi*d^2); %[m]

rH(1:length(z)) = rH;
Cp_CH4(1:length(z)) = Cp_CH4;
Cp_S2(1:length(z)) = Cp_S2;
Cp_CS2(1:length(z)) = Cp_CS2;
Cp_H2S(1:length(z)) = Cp_H2S;
koncentracny_profil_K = [z C_CH4 C_S2 C_CS2 C_H2S];
teplotny_profil_K = [z T];
molarne_tepelne_kapacity_K = [z Cp_CH4' Cp_S2' Cp_CS2' Cp_H2S'];
reakcna_entalpia_K = [z rH'];
save koncentracny_profil_K koncentracny_profil_K -v6
save teplotny_profil_K teplotny_profil_K -v6
save molarne_tepelne_kapacity_K molarne_tepelne_kapacity_K -v6
save reakcna_entalpia_K reakcna_entalpia_K -v6

function [dX]=reaktor(Vr,X,ni,Tf,Pf,R,Ff,rH,Cp_CH4,Cp_S2,Cp_CS2,Cp_H2S)

F_CH4=X(1);
F_S2=X(2);
F_CS2=X(3);
F_H2S=X(4);
T=X(5);

F=F_CH4+F_S2+F_CS2+F_H2S;
Vf=((Ff(1)+Ff(2))*R*Tf)./Pf;
V=(F./(Ff(1)+Ff(2))).*((T)./Tf).*Vf;


C_CH4=F_CH4./V;
C_S2=F_S2./V;

kv=(4.9e12)*exp(-17313./(T));%[dm3/mol/h]


ksiV=kv.*C_CH4.*C_S2;
dX(1)=(ni(1).*ksiV);
dX(2)=(ni(2).*ksiV);
dX(3)=(ni(3).*ksiV);
dX(4)=(ni(4).*ksiV);
dX(5)=(((-rH').*ksiV)./(F_CH4.*Cp_CH4'+F_S2.*Cp_S2'+F_CS2.*Cp_CS2'+F_H2S.*Cp_H2S'));
dX=dX';
end



