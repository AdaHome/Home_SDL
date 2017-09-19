package body Home_SDL.Plotter is

   procedure Update (Plot : Simple_Plot) is
   begin
      null;
   end Update;
   pragma Unreferenced (Update);

   procedure Draw (Plot : Simple_Plot; Renderer : Renderers.SDL_Renderer) is
      use Home_SDL.Renderers;
   begin
      --Draw_Line_Array (Renderer, Plot.Data, Plot.Data'Length);
      null;
   end Draw;


   procedure Append (Plot : in out Simple_Plot; Y : Shapes.Integer_Element) is
      use type Shapes.Integer_Element;
   begin
      Plot.Data (Plot.To).X := Shapes.Integer_Element (Plot.To) * Plot.Scale_X;
      Plot.Data (Plot.To).Y := Y;
      Plot.To := Shapes.Element_Count'Succ (Plot.To);
   end;

end Home_SDL.Plotter;
