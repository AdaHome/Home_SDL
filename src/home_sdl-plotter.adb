package body Home_SDL.Plotter is

   procedure Plot (Renderer : Renderers.SDL_Renderer; Data : XY_Array) is
      use Home_SDL.Renderers;
   begin
      for I in Data'First .. Draw_Element'Pred (Data'Last) loop
         Draw (Renderer, I, Data (I), Draw_Element'Succ (I), Data (Draw_Element'Succ (I)));
      end loop;
   end Plot;

end Home_SDL.Plotter;
