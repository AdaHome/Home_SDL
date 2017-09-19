package Home_SDL.Events is


   type Unsigned_32 is mod 2 ** 32 with
     Convention => C;
   for Unsigned_32'Size use 32;

   type Unsigned_8 is mod 2 ** 8 with
     Convention => C;
   for Unsigned_8'Size use 8;

   type Signed_32 is range -2 ** 31 .. 2 ** 31 - 1;
   for Signed_32'Size use 32;

   type Event_Kind is new Unsigned_32;


   SDL_QUIT : Event_Kind := 16#100#;

   type Event is record
      Kind : Event_Kind; -- SDL_WINDOWEVENT
      Time : Unsigned_32; -- In milliseconds, populated using SDL_GetTicks()
      ID : Unsigned_32; -- The associated window
      E : Unsigned_8; --SDL_WindowEventID
      Padding_1 : Unsigned_8;
      Padding_2 : Unsigned_8;
      Padding_3 : Unsigned_8;
      Data_1 : Signed_32; -- event dependent data
      Data_2 : Signed_32; -- event dependent data
   end record with Pack;

   --extern DECLSPEC int SDLCALL SDL_PollEvent(SDL_Event * event);
   function Poll (Item : out Event) return Integer with
     Import        => True,
     Convention    => C,
     External_Name => "SDL_PollEvent";

--     typedef struct SDL_WindowEvent
--  {
--      Uint32 type;        /**< ::SDL_WINDOWEVENT */
--      Uint32 timestamp;   /**< In milliseconds, populated using SDL_GetTicks() */
--      Uint32 windowID;    /**< The associated window */
--      Uint8 event;        /**< ::SDL_WindowEventID */
--      Uint8 padding1;
--      Uint8 padding2;
--      Uint8 padding3;
--      Sint32 data1;       /**< event dependent data */
--      Sint32 data2;       /**< event dependent data */
--  } SDL_WindowEvent;


end Home_SDL.Events;
