with Ada.Text_IO;
with Home_SDL;

with Interfaces.C;
with Home_SDL.Windows;
with Home_SDL.Renderers;
with Home_SDL.Geometry;
with Home_SDL.Drawings;
with Home_SDL.Events;


procedure Main2 is
   use Ada.Text_IO;
   use Home_SDL.Windows;
   use type Interfaces.C.char_array;
   use type Home_SDL.Windows.Window_Flags.Flag_Field;
   Window : Home_SDL.Windows.SDL_Window;
begin

   Put_Line ("Initialize SDL");
   declare
      use Home_SDL;
      use Home_SDL.Initialize_Flags;
   begin
      Initialize (Video);
   end;


   Put_Line ("Create SDL Window");
   Window := Create ("Title", 0, 0, 500, 500, True, True, 0, Window_Flags.Shown or Window_Flags.Resizable);

   --Put_Line ("Update_Surface");
   --Update_Surface (Window);

   declare
      use Home_SDL;
      use Home_SDL.Renderers;
      use Home_SDL.Geometry;
      use Home_SDL.Drawings;
      use Home_SDL.Events;
      Renderer : SDL_Renderer;
      Rectangle : constant Rectangle_2D := (100, 100, 100, 100);
      E : SDL_Event (SDL_FIRSTEVENT);
   begin

      Renderer := Create (Window, Renderer_Flags.Software);
      loop
         if Home_SDL.Events.Poll (E) = 1 then
            Put_Line ("Event! : " & E.Common.Kind'Image);
            null;
         end if;
         if E.Common.Kind = Events.SDL_QUIT then
            Put_Line ("SDL_QUIT");
            exit;
         end if;

         Set_Color (Renderer, 0, 0, 0, 255);
         Clear (Renderer);

         Set_Color (Renderer, 0, 0, 255, 255);
         Draw_Rectangle (Renderer, Rectangle);

         Present (Renderer);
      end loop;

      --delay 1.0;
      Destroy (Renderer);
   end;

   Destroy (Window);

   Ada.Text_IO.Put_Line ("Quit SDL");
   Home_SDL.Quit;

end Main2;
