with Ada.Text_IO;

with Home_SDL;
with Home_SDL.Windows;
with Home_SDL.Renderers;
with Home_SDL.Events;
with Home_SDL.Events_Kind;
with Home_SDL.GUI;
with Home_SDL.Geometry;

procedure Test_GUI is

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
      use Home_SDL.Events;
      use Home_SDL.Events_Kind;
      Renderer : SDL_Renderer;
      Button_Array : array (1 .. 4) of GUI.Basic_Element;
      E : SDL_Event;
      Should_Run : Boolean := True;
      R : Geometry.Rectangle_2D;
   begin
      Windows.Get_Rectangle (Window, R);

      for Button of Button_Array loop
         Button.Background.Normal := (100, 100, 100, 255);
         Button.Background.Hoover := (255, 255, 255, 255);
         Button.Background.Active := (100, 255, 255, 255);
      end loop;

      Geometry.Generate_Grid (Button_Array (1).Rectangle, R, (1, 2), 10, 10);
      Geometry.Generate_Grid (Button_Array (2).Rectangle, R, (1, 3), 10, 10);
      Geometry.Generate_Grid (Button_Array (3).Rectangle, R, (4, 2), 10, 10);
      Geometry.Generate_Grid (Button_Array (4).Rectangle, R, (3, 2), 10, 10);

      Renderer := Create (Window, Renderer_Flags.Software);
      while Should_Run loop
         while Home_SDL.Events.Poll (E) = 1 loop

            case E.Kind is

            when Events_Kind.SDL_QUIT =>
               Put_Line ("SDL_QUIT");
               Should_Run := False;
               exit;

            when Events_Kind.SDL_MOUSEMOTION =>
               --Put_Line ("Mouse motion" & E.Mouse1.Position.X'Image & " " & E.Mouse1.Position.Y'Image);
               --Put_Line ("Mouse motion" & E.Mouse1.Velocity.X'Image & " " & E.Mouse1.Velocity.Y'Image);
               for Button of Button_Array loop
                  GUI.Update (Button, E.Mouse.Position, 0);
               end loop;

            when Events_Kind.SDL_MOUSEBUTTONDOWN =>
               for Button of Button_Array loop
                  GUI.Update (Button, E.Mouse.Position, 1);
               end loop;

            when Events_Kind.SDL_MOUSEBUTTONUP =>
               for Button of Button_Array loop
                  GUI.Update (Button, E.Mouse.Position, 0);
               end loop;

            when others =>
               null;

            end case;

         end loop;

         for Button of Button_Array loop
            GUI.Render (Renderer, Button);
         end loop;

         Present (Renderer);
      end loop;

      --delay 1.0;
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


end Test_GUI;
