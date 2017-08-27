with Ada.Text_IO;
with Ada.Assertions;

package body Home_SDL is

   procedure Initialize (Flags : in Initialize_Flags.Flag_Field) is
      function SDL_Init (Flags : in Initialize_Flags.Flag_Field) return Interfaces.C.int with
        Import        => True,
        Convention    => C,
        External_Name => "SDL_Init";
      use type Interfaces.C.int;
      R : Interfaces.C.int;
   begin
      R := SDL_Init (Flags);
      Ada.Assertions.Assert (R = 0, "SDL_Init failed.");
   end Initialize;

   procedure Quit is
      procedure SDL_Quit with
        Import        => True,
        Convention    => C,
        External_Name => "SDL_Quit";
   begin
      SDL_Quit;
   end Quit;






end Home_SDL;
