with Ada.Text_IO;
with Home_SDL;


with Home_SDL.Windows;
with Home_SDL.Renderers;
with Home_SDL.Geometry;
with Home_SDL.Drawings;
with Home_SDL.Events;
with Home_SDL.Events_Kind;


procedure Test_Window is

   Window : Home_SDL.Windows.SDL_Window;

begin


   declare
      use Ada.Text_IO;
      use Home_SDL.Initialize_Flags;
   begin
      Put_Line ("Initialize SDL");
      Home_SDL.Initialize (Video);
   end;


   declare
      use Ada.Text_IO;
      use Home_SDL;
      use Home_SDL.Windows;
      use type Home_SDL.Windows.Window_Flags.Flag_Field;
   begin
      Put_Line ("Create SDL Window");
      Window := Create ("Title", 0, 0, 500, 500, True, True, 0, Window_Flags.Shown or Window_Flags.Resizable);
   end;


   declare
      use Ada.Text_IO;
      use Home_SDL;
      use Home_SDL.Renderers;
      use Home_SDL.Geometry;
      use Home_SDL.Drawings;
      use Home_SDL.Events;
      use Home_SDL.Events_Kind;
      Renderer : SDL_Renderer;
      Rectangle : constant Rectangle_2D := (100, 100, 100, 100);
      Event : SDL_Event;
      Should_Run : Boolean := True;
   begin
      Renderer := Create (Window, Renderer_Flags.Software);
      while Should_Run loop
         pragma Warnings (Off);
         while Poll (Event) = 1 loop
            pragma Warnings (On);
            case Event.Kind is
               when SDL_QUIT =>
                  Put_Line ("SDL_QUIT");
                  Should_Run := False;
               when others =>
                  Put_Line ("Event : " & Event.Kind'Image);
            end case;
         end loop;

         Set_Color (Renderer, 0, 0, 0, 255);
         Clear (Renderer);

         Set_Color (Renderer, 0, 0, 255, 255);
         Draw_Rectangle (Renderer, Rectangle);

         Present (Renderer);
      end loop;
      Destroy (Renderer);
   end;


   declare
      use Ada.Text_IO;
      use Home_SDL.Windows;
   begin
      Destroy (Window);
      Put_Line ("Quit SDL");
      Home_SDL.Quit;
   end;


end Test_Window;
