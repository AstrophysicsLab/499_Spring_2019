classdef Particle_Sim < handle
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Number_Particles;
        R = 0.16;
        R2 = 0.0256;
        Surface_Radius = 0.005;
        Surface_Thickness = 0.5E-3;
        Origin = [0,0,0];
        Energy;
        Temperature;
        Velocity;
        dt = 1E-7;
        Vdt;
        Mass;
        Diameter;
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
        Temperture_Loss_Constant =0;
        Wall_hit =[];
        Surface_hit =[];
        Sticking_Coeff =0.8;
        Stuck = 0;
        
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
        
           function Initialize_Array(obj,N,Velocities,Directions,Positions,Temperature)
             obj.Number_Particles = N;
             obj.Velocity = Velocities;
             obj.Direction = Directions;
             obj.Position = Positions;
             obj.Initial_Temperature = Temperature;

             
        end
      
        
        
        function Set_Temperature_Particle(obj, Temp)
            obj.Temperature = Temp;
            %obj.Velocity = Probable_Thermal_Velocity(obj.Mass, obj.Temperature);
           
        end
        
        function Set_Velocity(obj,velcoity)
            obj.Velocity =velcoity;
        end
        
        function Set_Temperture_Loss_Constant(obj, val)
           obj.Temperture_Loss_Constant = val;            
        end
     
        function Set_Random_Factor(obj, val)
           obj.Random_Factor = val; 
           
        end
        function Set_Intial_Position(obj)
            obj.Initial_Position = [obj.R/sqrt(3), obj.R/sqrt(3), obj.R/sqrt(3) ];
            obj.Position_Log = [obj.R/sqrt(3), obj.R/sqrt(3), obj.R/sqrt(3) ];
            obj.Position = obj.Position_Log;
        end
        
        
        function Set_Position(obj,position_IN)
                 
            obj.Initial_Position = [position_IN(1), position_IN(2), position_IN(3) ];
            obj.Position_Log = obj.Initial_Position;
            obj.Position = obj.Initial_Position;
        end
        
        
        function Set_Direction(obj,Direction)
           obj.Direction_Vector = Direction; 
        end
        
        function Get_Spherical(obj)
            [obj.Azimuth, obj.Elevation ] = cart2sph(obj.Direction_Vector(1),obj.Direction_Vector(2),obj.Direction_Vector(3));
        end
        
        function  Get_YPR(obj)
            obj.Yaw = atan2(obj.Direction_Vector(2),obj.Direction_Vector(1));
        end
      
        function Collision_Check(obj)
             if norm(obj.Position(1,:)) > obj.R- (obj.Velocity*obj.dt)
                 obj.Wall_Collisons = obj.Wall_Collisons + 1;     
                % obj.Velocity = Generate_Random_Velocities(1,obj.Wall_Temperature , obj.Mass);
                % obj.Wall_hit(end+1,:) =obj.Position(1,:); 
               % obj.Set_Temperature_Particle(obj.Wall_Temperature);
                obj.Random_Direction();
             end
            
        end



        
%         function Surface_Check(obj)
%             
%              if obj.Direction_Vector(3)< 0 && obj.Position(1) > -0.01...
%                       &&  obj.Position(1) < 0.01 && obj.Position(2) > -0.01 &&  obj.Position(2) < 0.01...
%                       && obj.Position(3) > 0 &&  obj.Position(3) < obj.Velocity*obj.dt 
%                 obj.Surface_Collisons = obj.Surface_Collisons + 1;          
%                 obj.Get_Spherical();
%                 obj.Azimuth = obj.Azimuth + pi*obj.Random_Factor*randn;
%                 obj.Elevation =  obj.Elevation + pi*obj.Random_Factor*randn;
%                 [obj.Direction_Vector(1),obj.Direction_Vector(2),obj.Direction_Vector(3)] = sph2cart( obj.Azimuth,obj.Elevation,1);
%                 obj.Set_Temperature_Particle( (obj.Temperature - obj.Temperature* obj.Temperture_Loss_Constant));
%                 obj.Set_Temperature_Particle(obj.Surface_Temperature);
%              end
%             
%         end
%         

 function Surface_Check(obj)
            
             if  norm([obj.Position(1) obj.Position(2)]) < obj.Surface_Radius...
                      && obj.Position(3) < obj.Surface_Thickness &&  obj.Position(3) >  -1*obj.Surface_Thickness 
                obj.Surface_Collisons = obj.Surface_Collisons + 1; 
                %disp('surface hit')
                  if obj.Surface_Collisons >0
                        r = rand;
                        if r >1-obj.Sticking_Coeff
                             obj.Stuck = 1;
                        end
                   
                   
                   end
                 obj.Surface_hit(end+1,:) =obj.Position(1,:); 
                obj.Get_Spherical();
                obj.Azimuth = obj.Azimuth + pi*obj.Random_Factor*randn;
%                 obj.Elevation =  obj.Elevation + pi*obj.Random_Factor*randn;
                    obj.Elevation =  obj.Elevation + pi;
                  % obj.Velocity = Generate_Random_Velocities(1,obj.Surface_Temperature , obj.Mass);
                [obj.Direction_Vector(1),obj.Direction_Vector(2),obj.Direction_Vector(3)] = sph2cart( obj.Azimuth,obj.Elevation,1);
                %obj.Set_Temperature_Particle( (obj.Temperature - obj.Temperature* obj.Temperture_Loss_Constant));
                %obj.Set_Temperature_Particle(obj.Surface_Temperature);
             end
            

 end
 
 


            function Random_Direction(obj)
            obj.Direction_to_Origin =  obj.Origin - obj.Position(1,:);
            obj.Direction_Vector = obj.Direction_to_Origin;
            obj.Get_Spherical();

%             obj.Azimuth = obj.Azimuth + 2*pi*0.05*randn;
       %      obj.Elevation =  obj.Elevation + 2*pi*0.05*randn;
             obj.Azimuth = obj.Azimuth +  normrnd(0,pi/4);
             obj.Elevation =  obj.Elevation+ normrnd(0,pi/4);% normrnd(2*pi,pi/6);
        %    obj.Azimuth = obj.Azimuth +  normrnd(0,pi/2);
        %    obj.Elevation =  obj.Elevation + normrnd(0,pi/2);
            [obj.Direction_Vector(1),obj.Direction_Vector(2),obj.Direction_Vector(3)] = sph2cart( obj.Azimuth,obj.Elevation,1);
        end
        
        function Rotate_Direction(obj)
              obj.Direction_Vector = Rotate_Z(obj.Direction_Vector, pi/4  );
              % obj.Direction_Vector = Rotate_Y(obj.Direction_Vector, pi  );
              % obj.Direction_Vector = Rotate_X(obj.Direction_Vector, pi  );
            
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
        
        
        
        
        function coll =Quick_Run(obj,Time )
            
              Iterations = (Time/obj.dt);
              obj.Position = obj.Position(1,:) + obj.Velocity*obj.dt*obj.Direction_Vector;
              for idx = 1:Iterations   
                obj.Collision_Check();
                obj.Surface_Check();
                obj.Position = obj.Position(1,:) + obj.Velocity*obj.dt*obj.Direction_Vector;
              end
             coll = obj.Surface_Collisons;
           % disp(obj.Surface_Collisons)
        end
        
         function coll =Quick_Run_Stick(obj,Time )
            
              Iterations = (Time/obj.dt);
              obj.Position = obj.Position(1,:) + obj.Velocity*obj.dt*obj.Direction_Vector;
              for idx = 1:Iterations   
                obj.Collision_Check();
                obj.Surface_Check();
                if obj.Stuck ==1
                    
                   break; 
                end
                obj.Position = obj.Position(1,:) + obj.Velocity*obj.dt*obj.Direction_Vector;
              end
             coll = obj.Surface_Collisons;
           % disp(obj.Surface_Collisons)
        end
        
     
        
        function Plot(obj)
            plot3(obj.Position_Log(:,1),obj.Position_Log(:,2),obj.Position_Log(:,3))
            grid on
            hold on 
            phi = linspace(0,2*pi,200);
            r = linspace(obj.R,obj.R,200);
            Surface_r =linspace(obj.Surface_Radius,obj.Surface_Radius,200);
            cirZ = linspace(0,0,200);
            [cirX, cirY] = pol2cart(phi,r);
            plot3(cirX, cirY,cirZ)
            plot3(cirX, cirZ, cirY)
            plot3(cirZ, cirY,cirX)
            [Surface_cirX, Surface_cirY] = pol2cart(phi,Surface_r);
             plot3(Surface_cirX, Surface_cirY,cirZ)
            % scatter3(obj.Wall_hit(:,1),obj.Wall_hit(:,2),obj.Wall_hit(:,3))
             if isempty(obj.Surface_hit) ==0
                scatter3(obj.Surface_hit(:,1),obj.Surface_hit(:,2),obj.Surface_hit(:,3),'r')
             end
        end
        
    end
end

