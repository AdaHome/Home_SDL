with Home_SDL.Drawings;

package body Home_SDL.GUI is

   procedure Render (Renderer : Renderers.SDL_Renderer; Element : Basic_Element) is
   begin
      if Element.Hoover then
         Drawings.Set_Color (Renderer, Element.Background_Color_Hoover);
      else
         Drawings.Set_Color (Renderer, Element.Background_Color);
      end if;
      Drawings.Draw_Rectangle (Renderer, Element.Rectangle);
   end Render;


   procedure Update (Element : in out Basic_Element; X : Geometry.Integer_Element; Y : Geometry.Integer_Element) is
   begin
      if Geometry.XY_In_Rectangle (X, Y, Element.Rectangle) then
         Element.Hoover := True;
      else
         Element.Hoover := False;
      end if;
   end;

   procedure Update (Element : in out Basic_Element; Point : Geometry.Point_2D) is
   begin
      Update (Element, Point.X, Point.Y);
   end;

   procedure Generate_Grid
     (Result : out Geometry.Rectangle_2D;
      Outline : Geometry.Rectangle_2D;
      Position : Geometry.Point_2D;
      R, C : Geometry.Integer_Element) is
      use type Geometry.Integer_Element;
      I : constant Geometry.Integer_Element := Position.X + Position.Y * R;
   begin
      Result.W := Outline.W / C;
      Result.H := Outline.H / R;
      Result.X := (Result.W * (I mod C));
      Result.Y := (Result.H * (I / C));
   end Generate_Grid;

   procedure Set_Pos
     (Element : in out Basic_Element;
      Outline : Geometry.Rectangle_2D;
      Point : Geometry.Point_2D;
      R, C : Geometry.Integer_Element) is
   begin
      Generate_Grid (Element.Rectangle, Outline, Point, R, C);
   end Set_Pos;

end Home_SDL.GUI;
