function print_sim(t, y, p)

%% Инициализация объектов
simFig = figure;
simFig.Name = 'Результаты моделирования';
simFig.Color = 'white';

simFig.Units = 'centimeters';
simFig.Position = [simFig.Position(1:2) p.PictSize(1) p.PictSize(2)];

simAx = axes;
hold(simAx, 'on');


if size(y, 2) == 2
    simPl = plot(simAx,t,y(:, 1));
    simPlref = plot(simAx,t,y(:, 2));  
    simPlref.LineStyle= '--'; 
    simPlref.LineWidth = p.LineWidth;
else
     simPl = plot(simAx,t,y);
end

simPl.LineStyle= '-'; 
simPl.LineWidth = p.LineWidth;

simAx.Parent = simFig;
simAx.Box = 'on';

simAx.XGrid = 'on';
simAx.YGrid = 'on';
%simAx.XMinorGrid = 'on';
%simAx.YMinorGrid = 'on';


simAx.FontName = 'Times';
simAx.XLabel.String = 'Время, с';
simAx.YLabel.String = p.Name;

simAx.XLabel.FontSize = p.FontSize;
simAx.YLabel.FontSize = p.FontSize;
hold(simAx, 'off');
exportgraphics(simFig,...
    strcat(userpath,'\pictures\','sim_',datestr(datetime('now'),'yyyy-mm-dd_HH-MM-SS'),'.pdf'),...
    'ContentType','vector');

end