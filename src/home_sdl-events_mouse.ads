with Home_SDL.Geometry;
with Home_SDL.Events_Kind;
with Home_SDL.Times;

package Home_SDL.Events_Mouse is

   use Events_Kind;

   type SDL_Mouse_Event is record
      Kind : SDL_Event_Kind;
      Time : Times.Timestamp_32;
      Window_ID : Unsigned_32;
      Which : Unsigned_32;
      State : Unsigned_32;
      X : Signed_32;
      Y : Signed_32;
      X_Rel : Signed_32;
      Y_Rel : Signed_32;
   end record;

   --Check if it is possable to use Point instead of X and Y coordinates.
   pragma Warnings (Off);
   pragma Assert (Signed_32'Size * 2 = Geometry.Point_2D'Size, "Point can not be used instead of X and Y coordinates");
   pragma Warnings (On);

   -- Using Point instead of X, Y.
   type Mouse_Event is record
      Kind : SDL_Event_Kind;
      Time : Unsigned_32;
      Window_ID : Unsigned_32;
      Which : Unsigned_32;
      State : Unsigned_32;
      Position : Geometry.Point_2D;
      Velocity : Geometry.Point_2D;
   end record;



end Home_SDL.Events_Mouse;
