with Home_SDL.Renderers;

package Home_SDL.Plotter is

   type XY_Array is array (Renderers.Draw_Element range <>) of Renderers.Draw_Element;

   procedure Plot (Renderer : Renderers.SDL_Renderer; Data : XY_Array);

end Home_SDL.Plotter;
