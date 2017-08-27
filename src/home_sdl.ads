with Interfaces.C;
with Interfaces.C.Strings;
with System;
with Ada.Streams;
with Ada.Streams.Stream_IO;

package Home_SDL is

   package Initialize_Options is
      type Option is private;

      Empty           : constant Option;
      -- No flags.

      Timer           : constant Option;
      -- Timer subsystem

      Audio           : constant Option;
      -- Audio subsystem

      Video           : constant Option;
      -- Video subsystem; automatically initializes the events subsystem

      Joystick        : constant Option;
      -- Joystick subsystem; automatically initializes the events subsystem

      Haptic          : constant Option;
      -- Haptic (force feedback) subsystem

      Game_Controller : constant Option;
      -- Controller subsystem; automatically initializes the joystick subsystem

      Events          : constant Option;
      -- Events subsystem

      No_Parachute    : constant Option;
      -- Compatibility; this flag is ignored

      Everything      : constant Option;
      -- All of the above subsystems

   private
      type Option is mod 2 ** 32 with Convention => C;
      Empty           : constant Option := 16#0000_0000#;
      Timer           : constant Option := 16#0000_0001#;
      Audio           : constant Option := 16#0000_0010#;
      Video           : constant Option := 16#0000_0020#;
      Joystick        : constant Option := 16#0000_0200#;
      Haptic          : constant Option := 16#0000_1000#;
      Game_Controller : constant Option := 16#0000_2000#;
      Events          : constant Option := 16#0000_4000#;
      No_Parachute    : constant Option := 16#0010_0000#;
      Everything      : constant Option := Timer or Audio or Video or Joystick or Haptic or Game_Controller or Events or No_Parachute;
   end Initialize_Options;

   procedure Initialize (Flags : in Initialize_Options.Option);
   -- Use this function to initialize the SDL library.
   -- This must be called before using most other SDL functions.
   -- SDL_Init() simply forwards to calling SDL_InitSubSystem().
   -- Therefore, the two may be used interchangeably.
   -- Though for readability of your code SDL_InitSubSystem() might be preferred.
   -- The file I/O and threading subsystems are initialized by default.
   -- You must specifically initialize other subsystems if you use them in your application.
   -- Logging works without initialization, too.
   -- If you want to initialize subsystems separately
   -- you would call SDL_Init(0) followed by SDL_InitSubSystem() with the desired subsystem flag.

   procedure Quit;
   -- Use this function to clean up all initialized subsystems.
   -- You should call it upon all exit conditions.
   -- You should call this function even if you have already shutdown each initialized subsystem with SDL_QuitSubSystem().
   -- It is safe to call this function even in the case of errors in initialization.
   -- If you start a subsystem using a call to that subsystem's init function
   -- (for example SDL_VideoInit()) instead of SDL_Init() or SDL_InitSubSystem(),
   -- then you must use that subsystem's quit function (SDL_VideoQuit()) to shut it down before calling SDL_Quit().
   -- You can use this function with atexit() to ensure that it is run when your application is shutdown,
   -- but it is not wise to do this from a library or other dynamically loaded code.

end Home_SDL;
