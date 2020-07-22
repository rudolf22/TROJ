function [z,T,V] = reaktor_launch(temperature,pressure,id,Ff,Vh)
FF = Ff;
if (isequal(id(1),get_id('CH4'))==0)
    i1 = find(id == get_id('CH4'));
    Ff(1) = FF(i1);
end
if (isequal(id(2),get_id('S2'))==0)
    i2 = find(id == get_id('S2'));
    Ff(2) = FF(i2);
end
if (isequal(id(3),get_id('CS2'))==0)
    i3 = find(id == get_id('CS2'));
    Ff(3) = FF(i3);
end
if (isequal(id(4),get_id('H2S'))==0)
    i4 = find(id == get_id('H2S'));
    Ff(4) = FF(i4);
end
ni=[-1 -2 1 2];
Tf=temperature; %[K]
Pf=pressure; %[kPa]
Ffs=[Ff(1) Ff(2) Ff(3) Ff(4)]; %[mol.h^(-1)]
R=8.314; %[J.mol^(-1).K^(-1)]
[Vr,X]=ode45(@reaktor,[0 Vh],[Ffs Tf],[],ni,Tf,Pf,R,Ffs,id);
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
end



function [dX]=reaktor(Vr,X,ni,Tf,Pf,R,Ffs,id)

F_CH4=X(1);
F_S2=X(2);
F_CS2=X(3);
F_H2S=X(4);
T=X(5);
env=get_env('T',T);
F=F_CH4+F_S2+F_CS2+F_H2S;
Vf=((Ffs(1)+Ffs(2)+Ffs(3)+Ffs(4))*R*Tf)./Pf;
V=(F./(Ffs(1)+Ffs(2)+Ffs(3)+Ffs(4))).*((T)./Tf).*Vf;
x=[F_CH4./F,F_S2./F,F_CS2./F,F_H2S./F];

C_CH4=F_CH4./V;
C_S2=F_S2./V;

kv=(4.9e12)*exp(-17313./(T));%[dm3/mol/h]

[rH,Cp_CH4,Cp_S2,Cp_CS2,Cp_H2S] = parametre(env,x,id);



ksiV=kv.*C_CH4.*C_S2;
dX(1)=(ni(1).*ksiV);
dX(2)=(ni(2).*ksiV);
dX(3)=(ni(3).*ksiV);
dX(4)=(ni(4).*ksiV);
dX(5)=(((-rH').*ksiV)./(F_CH4.*Cp_CH4'+F_S2.*Cp_S2'+F_CS2.*Cp_CS2'+F_H2S.*Cp_H2S'));
dX=dX';
end

function [rH,Cp_CH4,Cp_S2,Cp_CS2,Cp_H2S] = parametre(env,x,id)
rH=reaction_enthalpy(env);

if (isequal(id(1),get_id('CH4'))==0)
    id(1) = get_id('CH4');
else
    id(1) = id(1);
end
    sub{1}.id = id(1);
    sub{1}.x = x(1);
[Cp_CH4,out1]=molar_heat_capacity(env,sub(1));
if (isequal(id(2),get_id('S2'))==0)
    id(2) = get_id('S2');

else
    id(2) = id(2);
end
    sub{2}.id = id(2);
    sub{2}.x = x(2);
[Cp_S2,out2]=molar_heat_capacity(env,sub(2));
if (isequal(id(3),get_id('CS2'))==0)
    id(3) = get_id('CS2');
else
    id(3) = id(3);
end
    sub{3}.id = id(3);
    sub{3}.x = x(3);
[Cp_CS2,out3]=molar_heat_capacity(env,sub(3));
if (isequal(id(4),get_id('H2S'))==0)
    id(4) = get_id('H2S');
else
    id(4) = id(4);
end
    sub{4}.id = id(4);
    sub{4}.x = x(4);
[Cp_H2S,out4]=molar_heat_capacity(env,sub(4));
end
