% Функция для проверки на критерий Калмана
function [ControlM, ObserveM] = check_kalman(G)

if isa(G, "ss")
    
elseif isa(G, "tf")
    G = ss(G);   
else
    error("Что-то не так")
end

A = G.A;
B = G.B;
C = G.C;

n = size(A,1);
m = size(B,2);
q = size(C,1);

ControlM = [];
for i = 1:n
    ControlM = [ControlM A^(i-1)*B];
end

ObserveM = [];
for i = 1:n
    ObserveM = [ObserveM; C*A^(i-1)];
end

rControl = rank(ControlM, 1e-3);
rObserve = rank(ObserveM, 1e-3);

if rControl == n
    disp(strcat("Система управляема ранг матрицы = ", num2str(rControl)));
else
    warning(strcat("Система НЕ управляема ранг матрицы = ", num2str(rControl)));
end

if rObserve == n
    disp(strcat("Система наблюдаема, ранг матрицы = ", num2str(rObserve)));
else
    warning(strcat("Система НЕ наблюдаема ранг матрицы = ", num2str(rObserve)));
end
end