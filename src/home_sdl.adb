with Ada.Assertions;
with Home_SDL.Errors;

package body Home_SDL is

   procedure Initialize (Flags : in Initialize_Flags.Flag_Field) is
      use Ada.Assertions;
      Result : Initialize_Result;
   begin
      Result := Initialize (Flags);
      Assert (Result = 0, "SDL_Init failed. " & Errors.Get);
   end Initialize;

end Home_SDL;
