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

end Home_SDL.GUI;
