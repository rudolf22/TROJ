function U = heat_transfer(env,sub) 

t_exp=linspace(0,100,51)'; %[°C]
u_exp=[1.7921;1.6720;1.5674;1.4728;1.3860;1.3077;1.2363;1.1709;1.1111;1.0559;1.0050;0.9579;0.9142;0.8737;0.8360;0.8007;0.7679;0.7371;0.7085;0.6814;0.6560;0.6321;0.6097;0.5883;0.5683;0.5494;0.5315;0.5146;0.4985;0.4832;0.4688;0.4550;0.4418;0.4293;0.4174;0.4061;0.3952;0.3849;0.3750;0.3655;0.3565;0.3478;0.3395;0.3315;0.3239;0.3165;0.3095;0.3027;0.2962;0.2899;0.2838]/1000; %[Pa*s]
% n = input(' Zadaj stupen: ');
n=5;
Pol1 = polyfit(t_exp,u_exp,n);
u = polyval(Pol1,t_exp);
% figure(1)
% plot(t_exp,u,t_exp,u_exp,'o')
% title('Dynamicka viskozita vody')
% xlabel('t [°C]')
% ylabel('u [Pa*s]')

t_expPr=[linspace(0,90,19)';100]; %[°C]
lambdac_exp=[0.561;0.571;0.580;0.590;0.599;0.608;0.616;0.624;0.631;0.638;0.644;0.649;0.654;0.659;0.663;0.666;0.670;0.673;0.675;0.678]; %[W*m^(-1)*K^(-1)]
Prc_exp=[13.46;11.46;9.45;8.23;7.01;6.21;5.41;4.87;4.33;3.94;3.55;3.27;2.99;2.78;2.56;2.39;2.22;2.09;1.96;1.77]; %[1]
Pol2 = polyfit(t_expPr,lambdac_exp,n);
lambdac = polyval(Pol2,t_expPr);
% figure(2)
% plot(t_expPr,lambdac,t_expPr,lambdac_exp,'o')
% title('Tepelna vodivost vody')
% xlabel('t [°C]')
% ylabel('lambda [W*m^(-1)*K^(-1)]')
Pol3 = polyfit(t_expPr,Prc_exp,n);
Prc = polyval(Pol3,t_expPr);
% figure(3)
% plot(t_expPr,Prc,t_expPr,Prc_exp,'o')
% title('Prandtlovo cislo vody')
% xlabel('t [°C]')
% ylabel('Pr [1]')
% udaje o reaktore
dD=0.1; %[m]
dR=0.07; %[m]
dt=0.05; %[m]
dekv=dD-dR; %[m]
mc=5; %[kg*s^(-1)]
th=25; %[°C]
% vypocet alfac
uch = polyval(Pol1,th);
Rech=(dekv*(mc/((pi/4)*(dD^2-dR^2))))/uch;
Prch = polyval(Pol3,th);
Nuch=0.023*(Rech^(0.8))*(Prch^(0.4));
lambdach = polyval(Pol2,th);
alfa_c=(lambdach*Nuch)/dekv;
% vypocet alfah

p=env.p;
T=env.T;
R=8.314;
u_blend_h = dynamic_viscosity(env,sub);
M_h = molar_mass(sub);
ro_h = (p*M_h)/(R*T);
Ff=30;
Vf = (Ff*R*T)/p;
S=(pi*dt^2)/4;
u_h = (Vf/3600)/S;
Re_h=(dt*u_h*ro_h)/u_blend_h;
lam_h=0.14;
cp_blend_h = heat_capacity(env,sub);
cp_blend_h = cp_blend_h/M_h;
Pr_h=(u_blend_h*cp_blend_h)/lam_h;
Nu_h=0.023*(Re_h^(0.8))*(Pr_h^(0.3));
alfa_h=(lam_h*Nu_h)/dt;
% uhrnny koeficient prechodu tepla
lam_s=38;
h=(dR-dt)/2;
U = 1/((1/alfa_h)+(h/lam_s)+(1/alfa_c));
end