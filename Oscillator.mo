model Oscillator

//Параметры осциллятора
//x'' + g* x' + w^2* x = f(t)

/*Для первого случая:
parameter Real w = sqrt(14.4); //w - частота для первого случая
parameter Real g = 0.0; //g - затухание для первого случая*/

/*Для второго случая:
parameter Real w = sqrt(1); //w - частота для первого случая
parameter Real g = 17.0; //g - затухание для первого случая*/

/*Для третьего случая:*/
parameter Real w = sqrt(1.0); //w - частота для первого случая
parameter Real g = 15.0; //g - затухание для первого случая



parameter Real x0 = 2.0;
parameter Real y0 = -0.2;

Real x(start=x0);
Real y(start=y0);

//Правая часть уравнения f(t)
function f
  input Real t;
  output Real result;
algorithm
 // result := 0; //для первого и второго случаев
 result := 0.7*sin(3.0*t); //для третьего случая


end f;

equation

///Вектор-функция f(t, x)
///для решения системы дифференциальных уравнений
///x' = y(t, x)
///где x - искомый вектор
der(x) = y;
der(y) = -w*w*x - g*y - f(time);

end Oscillator;
