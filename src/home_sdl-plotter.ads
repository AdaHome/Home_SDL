with Home_SDL.Renderers;
with Home_SDL.Geometry;

package Home_SDL.Plotter is

   type Simple_Plot is record
      Rectangle : Geometry.Rectangle_2D;
      Scale_X : Geometry.Integer_Element := 1;
      Scale_Y : Geometry.Integer_Element := 1;
   end record;

   procedure Draw (Renderer : Renderers.SDL_Renderer; Plot : Simple_Plot);

   procedure Update (Plot : Simple_Plot; Data : in Geometry.Point_Array; Result : out Geometry.Point_Array);


end Home_SDL.Plotter;
