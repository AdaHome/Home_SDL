package Home_SDL.Colors is

   type Color_8 is new Interfaces.Unsigned_8;

   type Color_RGBA is record
      R : Color_8;
      G : Color_8;
      B : Color_8;
      A : Color_8;
   end record;

end Home_SDL.Colors;
