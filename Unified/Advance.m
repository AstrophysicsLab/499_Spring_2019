   function Position =Advance(Position,Direction,Velocity,dt )
   Position = Position + Velocity .* dt .* Direction;
   end