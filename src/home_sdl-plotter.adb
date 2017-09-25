with Home_SDL.Drawings;

package body Home_SDL.Plotter is

   procedure Update (Plot : Simple_Plot; Data : in Geometry.Point_Array; Result : out Geometry.Point_Array) is
      use type Geometry.Integer_Element;
      use type Geometry.Element_Count;
      subtype R is Geometry.Element_Count range 0 .. Data'Length - 1;
   begin
      for I in R loop
         Result (Data'First + I).X := Plot.Scale_X * Data (Data'First + I).X;
         Result (Data'First + I).Y := Plot.Scale_Y * Data (Data'First + I).Y;
      end loop;
   end Update;

   procedure Draw (Renderer : Renderers.SDL_Renderer; Plot : Simple_Plot) is
   begin
      Home_SDL.Drawings.Draw_Line (Renderer, 50, 100, 50, 0);
      Drawings.Draw_Line (Renderer, 0, 50, 100, 50);
   end Draw;

end Home_SDL.Plotter;
