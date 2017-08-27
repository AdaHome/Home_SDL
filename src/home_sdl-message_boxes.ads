with Home_SDL.Windows;

package Home_SDL.Message_Boxes is


   package Box_Flags is

      type Flag_Field is mod 2 ** 32 with Convention => C;

      Error       : constant Flag_Field;
      -- error dialog

      Warning     : constant Flag_Field;
      -- warning dialog

      Information : constant Flag_Field;
      -- informational dialog

   private

      Error       : constant Flag_Field := 16#0000_0010#;
      Warning     : constant Flag_Field := 16#0000_0020#;
      Information : constant Flag_Field := 16#0000_0040#;

   end Box_Flags;

   package Button_Flags is

      type Flag_Field is mod 2 ** 32 with Convention => C;

      None               : constant Flag_Field;

      Returnkey_Default  : constant Flag_Field;
      -- Marks the default button when return is hit

      Escapekey_Default  : constant Flag_Field;
      -- Marks the default button when escape is hit

   private

      None                  : constant Flag_Field := 16#0000_0000#;
      Returnkey_Default     : constant Flag_Field := 16#0000_0001#;
      Escapekey_Default     : constant Flag_Field := 16#0000_0002#;

   end Button_Flags;

   type SDL_Message_Box_Button_Data is record
      Flags : Button_Flags.Flag_Field;
      --SDL_MessageBoxButtonFlags

      Id : Interfaces.C.int;
      --User defined button id (value returned via SDL_ShowMessageBox)

      Text : Interfaces.C.Strings.char_array_access;
      -- The UTF-8 button text
   end record;

   type SDL_Message_Box_Button_Data_Array is array (Integer range <>) of SDL_Message_Box_Button_Data;
   type SDL_Message_Box_Button_Data_Array_Access is access all SDL_Message_Box_Button_Data_Array;

   type SDL_Message_Box_Color is record
      R : Interfaces.Unsigned_8;
      G : Interfaces.Unsigned_8;
      B : Interfaces.Unsigned_8;
   end record;

   package Box_Colors is

      type Color is (Background, Text, Button_Border, Button_Background, Button_Selected);
      for Color use
        (Background => 0,
         Text => 1,
         Button_Border => 2,
         Button_Background => 3,
         Button_Selected => 4);

   end Box_Colors;

   type SDL_Message_Box_Color_Array is array (Box_Colors.Color) of SDL_Message_Box_Color;

   type SDL_MessageBoxColorScheme is record
      Color_Array : SDL_Message_Box_Color_Array;
   end record;

   type SDL_MessageBoxColorScheme_Array is array (Integer range <>) of SDL_MessageBoxColorScheme;
   type SDL_MessageBoxColorScheme_Array_Access is access all SDL_MessageBoxColorScheme_Array;

   type SDL_Message_Box_Data is record
      Flags : Box_Flags.Flag_Field;
      --SDL_MessageBoxFlags

      Window : Windows.SDL_Window;
      -- Parent window, can be NULL

      Title : Interfaces.C.Strings.char_array_access;
      --UTF-8 title

      Message : Interfaces.C.Strings.char_array_access;
      -- UTF-8 message text

      Button_Count : Interfaces.C.int;

      Button_Array : SDL_Message_Box_Button_Data_Array_Access;
      Color_Scheme_Array : SDL_MessageBoxColorScheme_Array_Access;
      --SDL_MessageBoxColorScheme, can be NULL to use system settings
   end record;

   type SDL_Message_Box_Data_Array is array (Integer range <>) of SDL_Message_Box_Data;
   type SDL_Message_Box_Data_Array_Access is access all SDL_Message_Box_Data_Array;

   function SDL_ShowMessageBox (Item : access SDL_Message_Box_Data; Id : out Interfaces.C.int) return Interfaces.C.int with
     Import        => True,
     Convention    => C,
     External_Name => "SDL_ShowMessageBox";

   procedure Show (Item : aliased in out SDL_Message_Box_Data; Id : out Interfaces.C.int);


end Home_SDL.Message_Boxes;
