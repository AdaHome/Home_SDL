with Home_SDL.Errors;
with Ada.Assertions;

package body Home_SDL.Message_Boxes is

   procedure Show (Item : access Message_Box; Identity : out Button_Identity) is
      use Ada.Assertions;
      use type Interfaces.C.int;
      Result : Show_Result;
   begin
      Result := Show (Item, Identity);
      Assert (Result = 0, "SDL_ShowMessageBox failed. " & Errors.Get);
   end;

end Home_SDL.Message_Boxes;
