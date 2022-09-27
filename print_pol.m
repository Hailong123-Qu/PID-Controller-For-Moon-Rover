%%Функция, которая выводит полюсам модели объекта на комплексную плоскость
function poles = print_poles(H,p)

if isa(H,'ss')

elseif isa(H,'tf')
    H = ss(H);
else
    error("Что-то не так");
end

poles = complex(eig(H.A));

%% Инициализация объектов
polesFig = figure;
polesFig.Name = 'Полюса';
polesFig.Color = 'white';

polesFig.Units = 'centimeters';
polesFig.Position = [polesFig.Position(1:2) p.PictSize(1) p.PictSize(2)];

polesAx = axes;
polesPl = plot(polesAx,real(poles),imag(poles));


polesPl.LineStyle= 'none'; 
polesPl.Marker = '.';
polesPl.MarkerSize = p.MarkerSize;

polesAx.Parent = polesFig;
polesAx.Box = 'on';
polesAx.XAxisLocation = 'origin';
polesAx.YAxisLocation = 'origin';
polesAx.XGrid = 'on';
polesAx.YGrid = 'on';
polesAx.XMinorGrid = 'on';
polesAx.YMinorGrid = 'on';
polesAx.TickDir = "both"


polesAx.FontName = 'Times';
polesAx.XLabel.String = 'Re(s)';
polesAx.YLabel.String = 'Im(s)';

polesAx.XLabel.FontSize = p.FontSize;
polesAx.YLabel.FontSize = p.FontSize;

exportgraphics(polesFig,...
    strcat(userpath,'\pictures\','poles_',datestr(datetime('now'),'yyyy-mm-dd_HH-MM-SS'),'.pdf'),...
    'ContentType','vector');

end