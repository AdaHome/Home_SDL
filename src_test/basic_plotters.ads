with Home_SDL.Geometry;
with Home_SDL.Renderers;

package Basic_Plotters is

   subtype SDL_Renderer is Home_SDL.Renderers.SDL_Renderer;

   type Simple_Plot is record
      Rectangle : Home_SDL.Geometry.Rectangle_2D;
      Scale_X : Home_SDL.Geometry.Integer_Element := 1;
      Scale_Y : Home_SDL.Geometry.Integer_Element := 1;
   end record;

   procedure Draw
     (Renderer : SDL_Renderer;
      Plot : Simple_Plot;
      Data : Home_SDL.Geometry.Point_2D_Array);

end Basic_Plotters;
