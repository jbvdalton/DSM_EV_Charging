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

LambdaDA(t)		DA price 
/t1=354.01,t2=358.79,t3=344.95,t4=298.7,t5=282.37,t6=281.2,t7=254.79,t8=235.97, 
t9=227.4,t10=225.16,t11=225.45,t12=227.79,t13=234.51,t14=327.21,t15=392.51,t16=426.53/

LambdaRT(t,w)		RT price 
/t1.w1=333.13,t2.w1=310.48,t3.w1=350.00,t4.w1=363.37,t5.w1=337.81,t6.w1=332.12,t7.w1=272.70,
t8.w1=224.17,t9.w1=238.10,t10.w1=192.59,t11.w1=192.00,t12.w1=200.01,t13.w1=289.88,t14.w1=303.60,
t15.w1=374.36,t16.w1=379.24,

t1.w2=353.13,t2.w2=370.48,t3.w2=320.00,t4.w2=280.37,t5.w2=367.81,t6.w2=310.12,t7.w2=252.70,
t8.w2=244.17,t9.w2=268.10,t10.w2=220.59,t11.w2=232.00,t12.w2=250.01,t13.w2=200.88,t14.w2=260.60,
t15.w2=300.36,t16.w2=340.24/

*t1.w2=333.13,t2.w2=350.48,t3.w2=350.00,t4.w2=363.37,t5.w2=337.81,t6.w2=332.12,t7.w2=272.70,
*t8.w2=224.17,t9.w2=238.10,t10.w2=192.59,t11.w2=192.00,t12.w2=200.01,t13.w2=289.88,t14.w2=303.60,
*t15.w2=374.36,t16.w2=379.24/

LambdaR(t)		DA regulation price
/t1=116.555,t2=116.378,t3=116.343,t4=120.208,t5=120.362,t6=130.668,t7=250.666,
t8=260.274,t9=260.564,t10=260,t11=250.634,t12=260.569,t13=210.74,t14=210.481,
t15=170.487,t16=120.54/

u(t,i,w)                bnary parameter equal to 1 when ith vehicle is between T_arr & T_dep
      /t1 .i1 .w1 = 1, t2 .i1 .w1 = 1,
	   t3 .i1 .w1 = 1, t4 .i1 .w1 = 1,t5 .i1 .w1 = 1,
	   t6 .i1 .w1 = 1, t7 .i1 .w1 = 1,t8 .i1 .w1 = 1,
	   t9 .i1 .w1 = 1, t10.i1 .w1 = 1,t11.i1 .w1 = 1,
	   
       t3 .i2 .w1 = 1, t4 .i2 .w1 = 1,
	   t5 .i2 .w1 = 1, t6 .i2 .w1 = 1,t7 .i2 .w1 = 1,
	   t8 .i2 .w1 = 1, t9 .i2 .w1 = 1,t10.i2 .w1 = 1,
	   t11.i2 .w1 = 1, t12.i2 .w1 = 1,t13.i2 .w1 = 1,

	   t2 .i3 .w1 = 1,t3 .i3 .w1 = 1,t4 .i3 .w1 = 1,
	   t5 .i3 .w1 = 1,t6 .i3 .w1 = 1,t7 .i3 .w1 = 1,
	   t8 .i3 .w1 = 1,t9 .i3 .w1 = 1,t10.i3 .w1 = 1,
	   t11.i3 .w1 = 1,t12.i3 .w1 = 1,t13.i3 .w1 = 1,
	   t14.i3 .w1 = 1,t15.i3 .w1 = 1,t16.i3 .w1 = 1,
	   
*t2 .i1 .w2 = 1,t3 .i1 .w2 = 1, 
	   t4 .i1 .w2 = 1,
	   t5 .i1 .w2 = 1,t6 .i1 .w2 = 1, t7 .i1 .w2 = 1,
	   t8 .i1 .w2 = 1,t9 .i1 .w2 = 1, t10.i1 .w2 = 1,
	   t11.i1 .w2 = 1,t12.i1 .w2 = 1, t13.i1 .w2 = 1,
	   t14.i1 .w2 = 1,t15.i1 .w2 = 1,
	   
	   t2 .i2 .w2 = 1, t3 .i2 .w2 = 1,t4 .i2 .w2 = 1, 
	   t5 .i2 .w2 = 1, t6 .i2 .w2 = 1,t7 .i2 .w2 = 1,
	   t8 .i2 .w2 = 1, t9 .i2 .w2 = 1,t10.i2 .w2 = 1,
	   t11.i2 .w2 = 1, t12.i2 .w2 = 1,t13.i2 .w2 = 1,
	   t14.i2 .w2 = 1, t15.i2 .w2 = 1,

	   t4 .i3 .w2 = 1,
	   t5 .i3 .w2 = 1,t6 .i3 .w2 = 1,t7 .i3 .w2 = 1,
	   t8 .i3 .w2 = 1,t9 .i3 .w2 = 1,t10.i3 .w2 = 1,
	   t11.i3 .w2 = 1,t12.i3 .w2 = 1,t13.i3 .w2 = 1/

Ebat_max(i)             Energy capacity of EV battery /i1 100, i2 60, i3 100/

P_ch(i)                 Charger power /i1 6, i2 6, i3 6/

T_arr(i,w)              Arrival time    /i1 .w1 1,i2 .w1 3,i3 .w1 2
  									     i1 .w2 4,i2 .w2 2,i3 .w2 4/

T_dep(i,w)              Departure time  /i1 .w1 15,i2 .w1 13,i3 .w1 16
										 i1 .w2 11,i2 .w2 15,i3 .w2 13/

SOC_arr(i,w)            State of Energy /i1 .w1 0.64, i2 .w1 0.67, i3 .w1 0.61
										 i1 .w2 0.60, i2 .w2 0.70, i3 .w2 0.50/

SOC_dep(i,w)            SOC departure   /i1 .w1 0.9, i2 .w1 0.9, i3 .w1 0.9
									     i1 .w2 0.9, i2 .w2 0.9, i3 .w2 0.9/
;

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
 '/Users/jacobdalton/Dropbox/EG230X_MSc_Tibber/04_Code/Jacob/Vagro_winter.gdx'
;



