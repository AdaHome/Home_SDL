with Interfaces.C;
with Interfaces.C.Strings;
with System;
with Ada.Streams;
with Ada.Streams.Stream_IO;

package Home_SDL.Errors is

   type Error_String is private;

   function Get return Error_String with
     Import        => True,
     Convention    => C,
     External_Name => "SDL_GetError";

   function Get return String;

   procedure Clear_Error with
     Import        => True,
     Convention    => C,
     External_Name => "SDL_ClearError";

private

   type Error_String is new Interfaces.C.Strings.chars_ptr;

end Home_SDL.Errors;
