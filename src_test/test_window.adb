with Home_SDL;
with Home_SDL.Windows;

with Basic_Event_Loop;

procedure Test_Window is
begin

   Home_SDL.Initialize (Home_SDL.Initialize_Flags.Video);

   declare
      use Home_SDL;
      use Home_SDL.Windows;
      use Home_SDL.Windows.Window_Flags;
      Window : Home_SDL.Windows.SDL_Window;
      Should_Run : Boolean := True;
   begin
      Window := Windows.Create ("Title", 0, 0, 500, 500, True, True, 0, Shown or Resizable);
      while Should_Run loop
         Basic_Event_Loop (Should_Run);
         delay 0.01;
      end loop;
      Windows.Destroy (Window);
   end;

   Home_SDL.Quit;

end Test_Window;
