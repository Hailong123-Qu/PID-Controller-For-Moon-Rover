%% Блок для задания передаточной функции объекта
s = tf('s');
transfer_function = 2 * exp(- 0.3 * s) / (0.2 * s + 1);

%% Блок для расчета передаточной функции системы управления
% for_feedback = 2 * (2 - 0.3 * s) / ((0.2 * s + 1) * (2 + 0.3 * s));
% PID = pid(0.60210261, 0.6229488, -0.0014, 1 / 430.095124);
% control_system = feedback(for_feedback * PID, 1);

%% Блок для провреки систем на управляемость и наблюдаемость критерием Калмана
% check_kalman(transfer_function)

%% Блок для рисования полюсов систем
% param = struct;
% param.MarkerSize = 25;
% param.PictSize = [12 12];
% param.FontSize = 12;
% print_pol(control_system, param)

%% Блок для рисования временных зависимостей
param = struct;
param.LineWidth = 2;
param.PictSize = [10 6];
param.FontSize = 12;
param.Name = "Ошибка, градусы";
t = out.input.Time;
y = out.error.Data;
print_sim(t, y, param)


