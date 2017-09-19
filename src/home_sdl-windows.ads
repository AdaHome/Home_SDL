with Interfaces.C;
with System;

package Home_SDL.Windows is

   type SDL_Window is private;

   type Window_Position_X is new Interfaces.C.int range 0 .. Interfaces.C.int'Last;
   type Window_Position_Y is new Interfaces.C.int range 0 .. Interfaces.C.int'Last;

   type Window_Position_Special is mod 2 ** 32;
   for Window_Position_Special'Size use 32;

   Position_Centered : constant Window_Position_Special := 16#2FFF0000#;
   Position_Undefined : constant Window_Position_Special := 16#1FFF0000#;


   type Window_Width is new Interfaces.C.int range 1 .. 16384;
   type Window_Height is new Interfaces.C.int range 1 .. 16384;
   -- Window size is actually limited to 16384 x 16384 for all platforms at window creation.

   type Window_Title (<>) is private;



   Null_SDL_Window : constant SDL_Window;

   package Window_Flags is

      type Flag_Field is mod 2 ** 32 with Convention => C;
      -- The flags on a window

      None                : constant Flag_Field;


      Fullscreen          : constant Flag_Field;
      -- fullscreen window

      OpenGL              : constant Flag_Field;
      -- window usable with OpenGL context

      Shown               : constant Flag_Field;
      -- window is visible

      Hidden              : constant Flag_Field;
      -- window is not visible

      Borderless          : constant Flag_Field;
      -- no window decoration

      Resizable           : constant Flag_Field;
      -- window can be resized

      Minimised           : constant Flag_Field;
      -- window is minimized

      Maximised           : constant Flag_Field;
      -- window is maximized

      Input_Grabbed       : constant Flag_Field;
      -- window has grabbed input focus

      Input_Focus         : constant Flag_Field;
      -- window has input focus

      Mouse_Focus         : constant Flag_Field;
      --  window has mouse focus

      Fullscreen_Desktop  : constant Flag_Field;

      Foreign             : constant Flag_Field;
      -- window not created by SDL

      High_DPI            : constant Flag_Field;
      -- window should be created in high-DPI mode if supported

      Mouse_Capture       : constant Flag_Field;
      -- window has mouse captured (unrelated to INPUT_GRABBED)

      Always_On_Top       : constant Flag_Field;
      -- window should always be above others

      Skip_Taskbar        : constant Flag_Field;
      -- window should not be added to the taskbar

      Utility             : constant Flag_Field;
      -- window should be treated as a utility window

      Tooltip             : constant Flag_Field;
      -- window should be treated as a tooltip

      Popup_Menu          : constant Flag_Field;
      -- Window should be treated as a popup menu
   private
      None                : constant Flag_Field := 16#0000_0000#;
      Fullscreen          : constant Flag_Field := 16#0000_0001#;
      OpenGL              : constant Flag_Field := 16#0000_0002#;
      Shown               : constant Flag_Field := 16#0000_0004#;
      Hidden              : constant Flag_Field := 16#0000_0008#;
      Borderless          : constant Flag_Field := 16#0000_0010#;
      Resizable           : constant Flag_Field := 16#0000_0020#;
      Minimised           : constant Flag_Field := 16#0000_0040#;
      Maximised           : constant Flag_Field := 16#0000_0080#;
      Input_Grabbed       : constant Flag_Field := 16#0000_0100#;
      Input_Focus         : constant Flag_Field := 16#0000_0200#;
      Mouse_Focus         : constant Flag_Field := 16#0000_0400#;
      Fullscreen_Desktop  : constant Flag_Field := Fullscreen or 16#0000_1000#;
      Foreign             : constant Flag_Field := 16#0000_0800#;
      High_DPI            : constant Flag_Field := 16#0000_2000#;
      Mouse_Capture       : constant Flag_Field := 16#0000_4000#;
      Always_On_Top       : constant Flag_Field := 16#0000_8000#;
      Skip_Taskbar        : constant Flag_Field := 16#0001_0000#;
      Utility             : constant Flag_Field := 16#0002_0000#;
      Tooltip             : constant Flag_Field := 16#0004_0000#;
      Popup_Menu          : constant Flag_Field := 16#0008_0000#;
   end Window_Flags;

   function Create_Unsafe
     (Title : Window_Title;
      X : Window_Position_X;
      Y : Window_Position_Y;
      W : Window_Width;
      H : Window_Height;
      Flags : Window_Flags.Flag_Field) return SDL_Window with
     Import        => True,
     Convention    => C,
     External_Name => "SDL_CreateWindow";

   function Create
     (Title : String;
      X : Window_Position_X;
      Y : Window_Position_Y;
      W : Window_Width;
      H : Window_Height;
      Flags : Window_Flags.Flag_Field) return SDL_Window with
     Post          => Create'Result /= Null_SDL_Window;

   function Create
     (Title : String;
      X : Window_Position_X;
      Y : Window_Position_Y;
      W : Window_Width;
      H : Window_Height;
      Center_Y : Boolean;
      Center_X : Boolean;
      Monitor : Natural;
      Flags : Window_Flags.Flag_Field) return SDL_Window with
     Post          => Create'Result /= Null_SDL_Window;

   procedure Destroy (Window : SDL_Window) with
     Import        => True,
     Convention    => C,
     External_Name => "SDL_DestroyWindow",
     Pre           => Window /= Null_SDL_Window;


   --int SDL_UpdateWindowSurface(SDL_Window* window)
   function Update_Surface (Window : SDL_Window) return Integer with
     Import        => True,
     Convention    => C,
     External_Name => "SDL_UpdateWindowSurface",
     Pre           => Window /= Null_SDL_Window;

   procedure Update_Surface (Window : SDL_Window);




private

   type Window_Title is new Interfaces.C.char_array;
   type SDL_Window is new System.Address;
   Null_SDL_Window : constant SDL_Window := SDL_Window (System.Null_Address);

end Home_SDL.Windows;
