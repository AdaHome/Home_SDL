with Home_SDL.Windows;
with Ada.Assertions;

package body Home_SDL.Message_Boxes is

   procedure Show (Item : aliased in SDL_Message_Box_Data; Id : out Interfaces.C.int) is
      use Ada.Assertions;
      use type Interfaces.C.int;
      R : Interfaces.C.int;
   begin
      R := SDL_ShowMessageBox (Item'Access, Id);
      Assert (R = 0, "SDL_ShowMessageBox failed");
   end;

end Home_SDL.Message_Boxes;
