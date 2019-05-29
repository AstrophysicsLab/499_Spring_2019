classdef  Particles< handle
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Number_Particles;
        Radius_Chamber;
        Velocity = [];
        Mass = [];
        Diameter;
        Energy = [];
        Temperature= [];
        Initial_Temperature;
        Position = [0,0,0];
        Direction;
        Direction_Theta;
        Wall_Collisons = 0;
        Bugfinder = 'Bug Found'
        Surface_Collisons = 0;
        Origin = [0,0,0]
        dt;
        dtt = 800;
     
    end
    
    methods
        
        function Initialize_Positions(obj,N,R, mass,Diameter,Velocities,Directions,Positions,Temperature,dt)
             obj.Number_Particles = N;
             obj.Radius_Chamber = R;
             obj.Mass = ones(obj.Number_Particles, 1)*mass;
             obj.Diameter = Diameter;
             obj.Velocity = Velocities;
             obj.Direction = Directions;
             obj.Position = Positions;
             obj.Initial_Temperature = Temperature;
             obj.dt = dt;
             
        end
      
          function Advection(obj,idx)
             % disp('Advection')  
              obj.Position(idx,:) = obj.Position(idx,:) + obj.Velocity(idx)*obj.dt*obj.Direction(idx,:);
                  
                obj.Collision_Check(idx);
               % obj.Surface_Check(idx);

          end
          
          function MC_Collision(obj,M)
              N = obj.Number_Particles;
              V_r_Max = abs(max(obj.Velocity)-min(obj.Velocity));      
              jdx = 0;
              r = rand;
              while jdx < M
                  r = rand;
                  index = randi([1 N],1,1);
                  j = randi([1 N],1,1);
                  if j==index
                     while j== index
                         j = randi([1 N],1,1);
                     end  
                  end
                  r_ij = abs(obj.Velocity(index) -obj.Velocity(j));
                  if r_ij/V_r_Max > r
                   % disp('Molecule Collision')
                    Random_Direction(obj,index);
                    Random_Direction(obj,j)
                    jdx = jdx+1;
                  end
              end    
              

           end
          
          function Collision_Check(obj,idx)
             if norm(obj.Position(idx,:)) > obj.Radius_Chamber - (obj.Velocity(idx)*obj.dt)
                % disp('Hittttt')
                 %disp(obj.Wall_Collisons)
                obj.Wall_Collisons = obj.Wall_Collisons + 1;     
                
                obj.Random_Direction(idx);
             end
            
          end
        
           function Random_Direction(obj,idx)
            Direction_to_Origin =  obj.Origin - obj.Position(idx,:);
            obj.Direction(idx,:) = Direction_to_Origin;
            [Azimuth, Elevation ] = obj.Get_Spherical(idx);
            Azimuth = Azimuth + 2*pi*0.05*randn;
            Elevation =  Elevation + 2*pi*0.05*randn;
            [obj.Direction(idx,1),obj.Direction(idx,2),obj.Direction(idx,3)] = sph2cart( Azimuth,Elevation,1);
           end
        
           function [Azimuth,Elevation] = Get_Spherical(obj,idx)
            [Azimuth, Elevation ] = cart2sph(obj.Direction(idx,1),obj.Direction(idx,2),obj.Direction(idx,3));
        end
        
        function Surface_Check(obj,idx)
            % vt =obj.Velocity(idx)*obj.dt;
             vt = obj.dtt;
             if obj.Direction(idx,3)< 0 && obj.Position(1) > -0.01 -vt...
                      &&  obj.Position(idx,1) < 0.01+vt && obj.Position(idx,2) > -0.01-vt &&  obj.Position(idx,2) < 0.01+vt ...
                      && obj.Position(idx,3) > 0 &&  obj.Position(idx,3) < 0+vt 
                Stick = rand;
                Chance = rand;
                if Stick > Chance
                    obj.Velocity(idx) = 0;
                else    
                    % disp('Hittttt')
                    obj.Surface_Collisons = obj.Surface_Collisons + 1;          
                    [Azimuth, Elevation ] =obj.Get_Spherical(idx);
                    Azimuth = Azimuth + pi*randn;
                    Elevation =  Elevation + pi*randn;
                    [obj.Direction(idx,1),obj.Direction(idx,2),obj.Direction(idx,3)] = sph2cart( Azimuth,Elevation,1);
                    %obj.Set_Temperature_Particle( (obj.Temperature - obj.Temperature* obj.Temperture_Loss_Constant));
                    %obj.Set_Temperature_Particle(obj.Surface_Temperature);
                end
             end
          
        end
          
   end
    
end

