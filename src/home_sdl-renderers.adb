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

end Home_SDL.Renderers;
