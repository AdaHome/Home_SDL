with Ada.Text_IO;
with Home_SDL;

with Interfaces.C;
with Home_SDL.Windows;
with Home_SDL.Renderers;
with Home_SDL.Geometry;
with Home_SDL.Drawings;
with Home_SDL.Events;
with Home_SDL.Plotter;
with Home_SDL.Events_Kind;

procedure Test_Plotter is
   use type Interfaces.C.char_array;
   use type Home_SDL.Windows.Window_Flags.Flag_Field;
   Window : Home_SDL.Windows.SDL_Window;
begin



   declare
      use Home_SDL;
      use Home_SDL.Initialize_Flags;
      use Ada.Text_IO;
   begin
      Put_Line ("Initialize SDL");
      Initialize (Video);
   end;

   declare
      use Home_SDL.Windows;
      use Ada.Text_IO;
   begin
      Put_Line ("Create SDL Window");
      Window := Create ("Title", 0, 0, 500, 500, True, True, 0, Window_Flags.Shown or Window_Flags.Resizable);
   end;




   declare
      use Home_SDL;
      use Home_SDL.Renderers;
      use Home_SDL.Geometry;
      use Home_SDL.Drawings;
      use Home_SDL.Events;
      use Home_SDL.Plotter;
      use Ada.Text_IO;
      use type Events_Kind.SDL_Event_Kind;
      Renderer : SDL_Renderer;
      Rectangle : constant Rectangle_2D := (100, 100, 100, 100);
      E : SDL_Event;
      Should_Run : Boolean := True;
      R2 : constant Point_Array := ((0, 100), (100, 100));
      R : constant Point_Array := ((0, 12), (1, 14), (2, 15), (3, 37), (4, 34), (5, 12));
      R1 : Point_Array (R'Range);
      P : Simple_Plot;
   begin

      P.Scale_X := 1;
      Plotter.Update (P, R, R1);

      Renderer := Create (Window, Renderer_Flags.Software);
      while Should_Run loop

         pragma Warnings (Off);
         while Poll (E) = 1 loop
            pragma Warnings (On);

            --Put_Line ("Event! : " & E.Common.Kind'Image);
            if E.Common.Kind = Events_Kind.SDL_QUIT then
               Put_Line ("SDL_QUIT");
               Should_Run := False;
               exit;
            end if;

            if E.Common.Kind = Events_Kind.SDL_KEYDOWN then
               P.Scale_X := P.Scale_X + 1;
               Plotter.Update (P, R, R1);
            end if;

         end loop;

         Set_Color (Renderer, 0, 0, 0, 255);
         Clear (Renderer);

         Set_Color (Renderer, 0, 0, 255, 255);
         Draw_Rectangle (Renderer, Rectangle);

         Set_Color (Renderer, 0, 255, 0, 255);
         Draw_Line_Array (Renderer, R1, R1'Length);

         Set_Color (Renderer, 255, 0, 0, 255);
         Draw_Line_Array (Renderer, R2, R2'Length);
         Present (Renderer);
      end loop;

      --delay 1.0;
      Destroy (Renderer);
   end;

   Home_SDL.Windows.Destroy (Window);

   Ada.Text_IO.Put_Line ("Quit SDL");
   Home_SDL.Quit;

end Test_Plotter;