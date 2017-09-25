with Ada.Assertions;
with Home_SDL.Errors;

package body Home_SDL.Drawings is

   procedure Draw_Line (Renderer : SDL_Renderer; X1, Y1, X2, Y2 : Geometry.Integer_Element) is
      use Ada.Assertions;
      Result : Draw_Result;
   begin
      Result := Draw_Line (Renderer, X1, Y1, X2, Y2);
      Assert (Result = 0, "SDL_RenderDrawLine. " & Errors.Get);
   end Draw_Line;

   procedure Draw_Line_Array (Renderer : SDL_Renderer; Data : Geometry.Point_Array; Count : Geometry.Element_Count) is
      use Ada.Assertions;
      Result : Draw_Result;
   begin
      Result := Draw_Line_Array (Renderer, Data, Count);
      Assert (Result = 0, "SDL_RenderDrawLine. " & Errors.Get);
   end Draw_Line_Array;

   procedure Set_Color (Renderer : SDL_Renderer; R, G, B, A : Colors.Color_8) is
      use Ada.Assertions;
      Result : Draw_Result;
   begin
      Result := Set_Color (Renderer, R, G, B, A);
      Assert (Result = 0, "SDL_SetRenderDrawColor. " & Errors.Get);
   end;

   procedure Draw_Rectangle (Renderer : SDL_Renderer; Rectangle : Geometry.Rectangle_2D) is
      use Ada.Assertions;
      Result : Draw_Result;
   begin
      Result := Draw_Rectangle (Renderer, Rectangle);
      Assert (Result = 0, "SDL_RenderFillRect. " & Errors.Get);
   end;

end Home_SDL.Drawings;
