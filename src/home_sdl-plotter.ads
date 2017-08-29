with Home_SDL.Renderers;
with Home_SDL.Shapes;

package Home_SDL.Plotter is

   type Simple_Plot is record
      Rectangle : Shapes.Rectangle_2D;
      Data : Shapes.Point_Array (1 .. 1000);
      From : Shapes.Element_Count := 0;
      To : Shapes.Element_Count := 1;
   end record;

   procedure Draw (Plot : Simple_Plot; Renderer : Renderers.SDL_Renderer);
   procedure Append (Plot : in out Simple_Plot; Y : Shapes.Integer_Element);

end Home_SDL.Plotter;
