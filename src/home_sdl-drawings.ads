with Home_SDL.Shapes;
with Home_SDL.Colors;
with Home_SDL.Renderers;

package Home_SDL.Drawings is

   use Home_SDL.Renderers;

   type Draw_Result is new Interfaces.C.int;

   function Set_Color (Renderer : SDL_Renderer; R, G, B, A : Colors.Color_8) return Draw_Result with
     Import        => True,
     Convention    => C,
     External_Name => "SDL_SetRenderDrawColor",
     Pre           => Renderer /= Null_Renderer;
   -- Use this function to set the color used for drawing operations (Rect, Line and Clear).
   -- Returns 0 on success or a negative error code on failure; call SDL_GetError() for more information.

   procedure Set_Color (Renderer : SDL_Renderer; R, G, B, A : Colors.Color_8) with
     Pre => Renderer /= Null_Renderer;
   -- Use this function to set the color used for drawing operations (Rect, Line and Clear).

   function Draw_Line (Renderer : SDL_Renderer; X1, Y1, X2, Y2 : Shapes.Integer_Element) return Draw_Result with
     Import        => True,
     Convention    => C,
     External_Name => "SDL_RenderDrawLine",
     Pre           => Renderer /= Null_Renderer;

   procedure Draw_Line (Renderer : SDL_Renderer; X1, Y1, X2, Y2 : Shapes.Integer_Element) with
     Pre => Renderer /= Null_Renderer;

   pragma Warnings (Off);
   function Draw_Line_Array (Renderer : SDL_Renderer; Data : Shapes.Point_Array; Count : Shapes.Element_Count) return Draw_Result with
     Import        => True,
     Convention    => C,
     External_Name => "SDL_RenderDrawLines",
     Pre           => Renderer /= Null_Renderer;
   pragma Warnings (On);

   procedure Draw_Line_Array (Renderer : SDL_Renderer; Data : Shapes.Point_Array; Count : Shapes.Element_Count);



   --  int SDL_RenderFillRect(SDL_Renderer*   renderer,
   --                         const SDL_Rect* rect)
   function Draw_Rectangle (Renderer : SDL_Renderer; Rectangle : Shapes.Rectangle_2D) return Draw_Result with
     Import        => True,
     Convention    => C,
     External_Name => "SDL_RenderFillRect",
     Pre           => Renderer /= Null_Renderer;

   procedure Draw_Rectangle (Renderer : SDL_Renderer; Rectangle : Shapes.Rectangle_2D);




end Home_SDL.Drawings;
