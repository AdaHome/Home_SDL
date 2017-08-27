package body Home_SDL.Windows is

   function SDL_CreateWindow
     (Title : Window_Title;
      X : Window_Position_X;
      Y : Window_Position_Y;
      W : Window_Width;
      H : Window_Width;
      Flags : Window_Flags.Flag_Field) return SDL_Window with
     Import        => True,
     Convention    => C,
     External_Name => "SDL_CreateWindow";

   function Create
     (Title : Window_Title;
      X : Window_Position_X;
      Y : Window_Position_Y;
      W : Window_Width;
      H : Window_Width;
      Flags : Window_Flags.Flag_Field) return SDL_Window is
      Window : SDL_Window;
   begin
      Window := SDL_CreateWindow (Title, X, Y, W, H, Flags);
      return Window;
   end Create;

   function Create
     (Title : String;
      X : Window_Position_X;
      Y : Window_Position_Y;
      W : Window_Width;
      H : Window_Width;
      Flags : Window_Flags.Flag_Field) return SDL_Window is
      Window : SDL_Window;
      C_Title : constant Window_Title := Window_Title (Interfaces.C.To_C (Title));
   begin
      Window := SDL_CreateWindow (C_Title, X, Y, W, H, Flags);
      return Window;
   end Create;

   procedure SDL_Destroy (Window : SDL_Window) with
     Import        => True,
     Convention    => C,
     External_Name => "SDL_DestroyWindow";

   procedure Destroy (Window : SDL_Window) is
   begin
      SDL_Destroy (Window);
   end;


end Home_SDL.Windows;
