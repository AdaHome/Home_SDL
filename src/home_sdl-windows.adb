with Ada.Assertions;
with Home_SDL.Errors;

package body Home_SDL.Windows is

   function Create
     (Title : String;
      X : Window_Position_X;
      Y : Window_Position_Y;
      W : Window_Width;
      H : Window_Width;
      Flags : Window_Flags.Flag_Field) return SDL_Window is
      Window : SDL_Window;
      C_Title : constant Window_Title := Window_Title (Interfaces.C.To_C (Title));
      use Ada.Assertions;
   begin
      Home_SDL.Errors.Clear_Error;
      Window := Create_Unsafe (C_Title, X, Y, W, H, Flags);
      Assert (Window /= Null_SDL_Window, Errors.Get);
      return Window;
   end Create;

end Home_SDL.Windows;
