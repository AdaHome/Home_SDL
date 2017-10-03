with Home_SDL.Drawings;

package body Home_SDL.GUI is


   procedure Render (Renderer : Renderers.SDL_Renderer; Element : Basic_Element) is
   begin
      if Element.Active then
         Drawings.Set_Color (Renderer, Element.Background.Active);
      elsif Element.Hoover then
         Drawings.Set_Color (Renderer, Element.Background.Hoover);
      elsif Element.Toggle then
         Drawings.Set_Color (Renderer, Element.Background.Toggle);
      else
         Drawings.Set_Color (Renderer, Element.Background.Normal);
      end if;
      Drawings.Draw_Rectangle (Renderer, Element.Rectangle);
   end Render;


   procedure Update (Element : in out Basic_Element; Point : Geometry.Point_2D; B : Integer) is
   begin
      if Geometry.XY_In_Rectangle (Point.X, Point.Y, Element.Rectangle) then
         if B = 1 then
            Element.Active := True;
         else
            Element.Hoover := True;
            Element.Active := False;
         end if;
      else
         Element.Hoover := False;
         Element.Active := False;
      end if;
   end;


end Home_SDL.GUI;
