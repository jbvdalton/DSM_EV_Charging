*cd /Users/jacobdalton/Dropbox/EG230X_MSc_Tibber/04_Code/Jacob

Sets
t       number of time steps /t1*t16/     
*t1 = 16:00pm, t16 = 10:00am
i       number of vehicles /i1*i3/
w       scenarios /w1,w2/
;

Scalar
Eff_ch                  Efficiency of charge /0.9/
min_ch                  Minimum charge /0/
;

Parameters
Pi(w)                   Probability of scenario w /w1=0.5, w2=0.5/
LambdaDA(t)				DA price 
LambdaRT(t,w)			RT price 
LambdaR(t)				DA regulation price
u(t,i,w)                bnary parameter equal to 1 when ith vehicle is between T_arr & T_dep
Ebat_max(i)             Energy capacity of EV battery 
P_ch(i)                 Charger power 
T_arr(i,w)              Arrival time 
T_dep(i,w)              Departure time 
SOC_arr(i,w)            State of Energy 
SOC_dep(i,w)            SOC departure 
;

$GDXIN /Users/jacobdalton/Dropbox/EG230X_MSc_Tibber/04_Code/Jacob/Vagro_2S.gdx
$LOAD  LambdaDA, LambdaRT, LambdaR, u, Ebat_max, P_ch, T_arr, T_dep, SOC_arr, SOC_dep
$GDXIN

Variables
SOC(t,i,w)              SOC
E_DA(t)                 Energy bid day ahead
R_DA(t)                 Regulation bid day ahead
E_RT(t,w)               Energy consumption RT Total
E_RTi(t,i,w)            Energy consumption RT of ith vehicle
Pmax(t,i,w)				Max RT Power consumption of ith vehicle
Delta_E(t,w)            Energy difference RT & DA
Pmax(t,i,w)				Max RT Power consumption of ith vehicle
Profit                  Aggregator Profit
A						DA cost 
B						RT Cost 
R						Regulation Return
*Rup(t)					Regulation up max 
*Rdw(t)					Regulation down max
*E_DAo(t)				E_DAout
;

Equations
Obj                     Objective function
Aeq						Obj1 DA Cost 
Beq						Obj2 RT Cost 
Req						Obj3 Reg. Return
Edev_eq(t,w)            Energy Deviation between RT & DA
E_RT_eq(t,w)            Energy consumption RT
E_RTi_eq(t,i,w)         Energy consumption i RT
Pmax_eq(t,i,w)			Pmax
SOC_eq(t,i,w)           State of charge time plus 1
SOC_Tdep(t,i,w)         SOC at departure
SOC_Tarr(t,i,w)         SOC at arrival
R_up(t,w)               Regulation up max
R_d(t,w)                Regulation down max
*Regu(t,w)				Regulation DA up boundary
*Regd(t,w)				Regulation DA down boundary
*E_DAeq(t)				E_DAout
;

Obj .. R - A - B =e= Profit;

Aeq .. A =e= 1/1000 * sum(t,LambdaDA(t) * E_DA(t));			
Beq .. B =e= 1/1000 * sum(w, Pi(w) * sum(t,LambdaRT(t,w) * Delta_E(t,w)));
Req .. R =e= 1/1000 * sum(t,LambdaR(t) * R_DA(t));

Edev_eq(t,w) .. Delta_E(t,w) =e= E_RT(t,w) - E_DA(t);
E_RT_eq(t,w) .. E_RT(t,w) =e= sum(i, E_RTi(t,i,w));
E_RTi_eq(t,i,w) .. E_RTi(t,i,w) =l= (Pmax(t,i,w) + Pmax (t+1,i,w))/2;
Pmax_eq(t,i,w) .. Pmax(t,i,w) =l= u(t,i,w) * P_ch(i);

* and ord(t) le T_dep(i,w)
SOC_eq(t,i,w)$(ord(t) gt T_arr(i,w)) .. 
SOC(t,i,w) =e= SOC(t-1,i,w) + (Eff_ch * E_RTi(t-1,i,w)/Ebat_max(i));

SOC_Tdep(t,i,w)$(ord(t) ge T_dep(i,w)) .. SOC(t,i,w) =e= SOC_dep(i,w);
SOC_Tarr(t,i,w)$(ord(t) eq T_arr(i,w)) .. SOC(t,i,w) =e= SOC_arr(i,w);

R_up(t,w) .. R_DA(t) =l= E_RT(t,w);
R_d(t,w) .. R_DA(t) =l= sum(i, u(t,i,w) * P_ch(i)) - E_RT(t,w);
*Regu(t,w) .. R_DA(t) =l= Rup(t);
*Regd(t,w) .. R_DA(t) =l= Rdw(t);


E_RTi.lo(t,i,w) = 0;
*E_RTi.up(t,i,w) = u(t,i,w) * P_ch(i);
E_DA.lo(t) = 0;
E_DA.up(t) = sum(i, P_ch(i));
SOC.lo(t,i,w) = min_ch;
SOC.up(t,i,w) = 1;

Model
Maxprofit /all/
;

Solve
Maxprofit using MIP maximizing Profit
;

Display
profit.l, A.l, B.l, R.l, E_DA.l, Delta_E.l, R_DA.l, E_RTi.l, E_RT.l, SOC.l
;

file output;
R_DA.l(t)$(Not R_DA.l(t)) = EPS;
E_DA.l(t)$(Not E_DA.l(t)) = EPS;
Delta_E.l(t,w)$(Not Delta_E.l(t,w)) = EPS;
E_RT.l(t,w)$(Not E_RT.l(t,w)) = EPS;
E_RTi.l(t,i,w)$(Not E_RTi.l(t,i,w)) = EPS;
SOC.l(t,i,w)$(Not SOC.l(t,i,w)) = EPS;

Execute_unload
 '/Users/jacobdalton/Dropbox/EG230X_MSc_Tibber/04_Code/Jacob/Vagro.gdx'
;
