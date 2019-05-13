function View_Cells(MC_Molecules, idx)
%UNTITLED11 Summary of this function goes here
%   Detailed explanation goes here
R = MC_Molecules(1).Radius_Chamber;
if idx == 0
    for jdx = 1:8
        scatter3(MC_Molecules(jdx).Position(:,1),MC_Molecules(jdx).Position(:,2) , MC_Molecules(jdx).Position(:,3), '.')
        hold on
    end
else   
    scatter3(MC_Molecules(idx).Position(:,1),MC_Molecules(idx).Position(:,2) , MC_Molecules(idx).Position(:,3), '.')

end
            hold on
            phi = linspace(0,2*pi,200);
            r = linspace(R,R,200);
            cirZ = linspace(0,0,200);
            [cirX, cirY] = pol2cart(phi,r);
            plot3(cirX, cirY,cirZ)
            plot3(cirX, cirZ, cirY)
            plot3(cirZ, cirY,cirX)
end

