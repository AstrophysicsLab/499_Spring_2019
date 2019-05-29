classdef  MC_Par< handle
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Number_Particles;
        R = 0.16;
        Surface_Radius = 0.005;
        Surface_Thickness = 0.5E-3;
        Origin = [0,0,0];
        dt = 1E-7;
        Vdt;
        Velocity = [];
        Mass;
        Diameter;
        Energy = [];
        Temperature= [];
        Momentum;
        Initial_Position =[];
        Position;
        Position_Log;
        Direction_Vector = [-0.8881,   -0.3251,   -0.3251];
        Direction_to_Origin;
        Azimuth;
        Elevation;
        Pitch;
        Yaw;
        Roll;
        Random_Factor =1;
        Wall_Collisons = 0;
        Wall_Temperature = 310;
        Surface_Collisons = 0;
        Surface_Temperature = 10;
        Avogadro = 6.022140857E23; % mol-1
        Wall_hit =[];
        Surface_hit =[];
        Sticking_Coeff =0.8;
        Stuck = 0;
        Direction;
        Direction_Theta;
        Bugfinder = 'Bug Found'
        Additional_Positions;
        Additional_Directions;
        Additional_Velocities;
     
    end
    
    methods
        
            function Set_Molecule(obj,Particle_String)
            
                switch Particle_String
    
                    case {'h2', 'H2'}
                        H_2_g_mol = 2.01588;  %g/mol   
                        obj.Mass =  H_2_g_mol *1/obj.Avogadro *1/1000;
                        obj.Diameter = 289E-12; % pi 
                    case {'o2', 'O2'}
                        obj.Mass = 31.998*1/obj.Avogadro *1/1000; % g/mol
                        obj.Diameter = 3.46E-10; %Angstoms
                end
             
            
            end
        
        
        function Initialize_Positions(obj,N,Velocities,Directions,Positions,Temperature)
             obj.Number_Particles = N;
             obj.Velocity = Velocities;
             obj.Direction = Directions;
             obj.Position = Positions;
             obj.Temperature = Temperature;
         
        end
      
        function Additional_Particles(obj,Velocities,Directions,Positions)
             obj.Additional_Velocities = Velocities;
             obj.Additional_Directions = Directions;
             obj.Additional_Positions = Positions;
         
        end
        
        
        
          function Advection(obj,idx)
             % disp('Advection')  
              obj.Position(idx,:) = obj.Position(idx,:) + obj.Velocity(idx)*obj.dt*obj.Direction(idx,:);
                  
                obj.Collision_Check(idx);
               % obj.Surface_Check(idx);

          end
          
          
          function Advection_Array(obj)
             % disp('Advection')  
              obj.Position = obj.Position + obj.Velocity .* obj.dt .* obj.Direction;
                  
                obj.Collision_Check();
                obj.Surface_Check();

          end
          
         function Run_Particle(obj,Time )
             Iterations = (Time/obj.dt);
             obj.Position_Log(end+1,:) = obj.Position_Log(end,:) + obj.Velocity*obj.dt*obj.Direction_Vector;
             obj.Position = obj.Position_Log(end,:);
              for idx = 1:Iterations   
%                if norm(obj.Position_Log(end,:)) > 1- 5E-4
%                disp('Collision')          
%                break
%                end
                obj.Collision_Check();
                obj.Surface_Check();
                obj.Position_Log(end+1,:) = obj.Position_Log(end,:) + obj.Velocity*obj.dt*obj.Direction_Vector;
                obj.Position = obj.Position_Log(end,:);
             end
             obj.Plot();
         end
          
          
          
          function Collision_Check(obj)
              Collision_Array =vecnorm(obj.Position,2,2);
              Index = find(Collision_Array > obj.R);
                if isempty(Index) == 0
                    obj.Wall_Collisons = obj.Wall_Collisons + length(Index);     
                
                    obj.Random_Direction(Index);
                end
            
          end
        
           function Random_Direction(obj,Index)
            DTO =  obj.Origin - obj.Position(Index,:);
            
            obj.Direction(Index,:) = DTO;
            [Azimuth, Elevation ] = obj.Get_Spherical(Index);
            Azimuth = Azimuth +  normrnd(0,pi/4);
            Elevation = Elevation +  normrnd(0,pi/4);
            [obj.Direction(Index,1),obj.Direction(Index,2),obj.Direction(Index,3)] = sph2cart( Azimuth,Elevation,1);
            
           end
        
           function [Azimuth,Elevation] = Get_Spherical(obj,Index)
            [Azimuth, Elevation ] = cart2sph(obj.Direction(Index,1),obj.Direction(Index,2),obj.Direction(Index,3));
        end
        
        function Surface_Check(obj)
            Index = find(obj.Position(:,3) < 0.0005 & obj.Position(:,3) > -0.0005 );
            if isempty(Index)
                return
                
            else
                     Collision_Array=  vecnorm(obj.Position(Index,1:2),2,2);
                       jdex = find(Collision_Array < obj.Surface_Radius);
                       if isempty(jdex) == 0
                            obj.Surface_Collisons = obj.Surface_Collisons + length(jdex);     
                           
                            idx = Index(jdex);
                            %obj.Number_Particles = obj.Number_Particles -length(jdex);
                            obj.Stuck = obj.Stuck + length(jdex);
                            obj.Velocity(idx) = obj.Additional_Velocities(idx);
                            obj.Direction(idx,:) = obj.Additional_Directions(idx,:);
                            obj.Position(idx,:)  = obj.Additional_Positions(idx,:);
                            
                         
                       end
            end
        end
          
        function Plot_Positions(obj)
            
            phi = linspace(0,2*pi,200);
            r = linspace(obj.R,obj.R,200);
            Surface_r =linspace(obj.Surface_Radius,obj.Surface_Radius,200);
            cirZ = linspace(0,0,200);
            [cirX, cirY] = pol2cart(phi,r);
            plot3(cirX, cirY,cirZ);
            hold on
            plot3(cirX, cirZ, cirY);
            plot3(cirZ, cirY,cirX);
            [Surface_cirX, Surface_cirY] = pol2cart(phi,Surface_r);
             plot3(Surface_cirX, Surface_cirY,cirZ);
            grid on
            scatter3(obj.Position(:,1),obj.Position(:,2),obj.Position(:,3),'.');

        end
        
        
        
        
    end
   
    
    
    
end

