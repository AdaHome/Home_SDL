with Ada.Assertions;
with Home_SDL.Errors;

package body Home_SDL.Renderers is

   function Create (Window : Windows.SDL_Window; Flags : Renderer_Flags.Flag_Field) return SDL_Renderer is
      use Ada.Assertions;
      Renderer : SDL_Renderer;
   begin
      Renderer := Create_Unsafe (Window, -1, Flags);
      Assert (Renderer /= Null_Renderer, "SDL_CreateRenderer. " & Errors.Get);
      return Renderer;
   end;

   procedure Draw_Line (Renderer : SDL_Renderer; X1, Y1, X2, Y2 : Shapes.Integer_Element) is
      use Ada.Assertions;
      Result : Draw_Result;
   begin
      Result := Draw_Line (Renderer, X1, Y1, X2, Y2);
      Assert (Result = 0, "SDL_RenderDrawLine. " & Errors.Get);
   end Draw_Line;

   procedure Draw_Line_Array (Renderer : SDL_Renderer; Data : Shapes.Point_Array; Count : Shapes.Element_Count) is
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

end Home_SDL.Renderers;
