with Ada.Text_IO;

with Home_SDL;
with Home_SDL.Windows;
with Home_SDL.Renderers;
with Home_SDL.Events;
with Home_SDL.Events_Kind;
with Home_SDL.Geometry;

with Basic_GUI;

procedure Test_GUI is

   Window : Home_SDL.Windows.SDL_Window;

begin

   Home_SDL.Initialize (Home_SDL.Initialize_Flags.Video);

   declare
      use Home_SDL;
      use Home_SDL.Windows.Window_Flags;
   begin
      Window := Windows.Create ("Title", 0, 0, 500, 500, True, True, 0, Shown or Resizable);
   end;

   declare
      use Ada.Text_IO;
      use Home_SDL;
      use Home_SDL.Renderers;
      use Home_SDL.Events;
      use Home_SDL.Events_Kind;
      Renderer : SDL_Renderer;
      Button_Array : Basic_GUI.Basic_Element_Array (1 .. 4);
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
               Basic_GUI.Update (Button_Array, E.Mouse.Position, 0);
            when Events_Kind.SDL_MOUSEBUTTONDOWN =>
               Basic_GUI.Update (Button_Array, E.Mouse.Position, 1);
            when Events_Kind.SDL_MOUSEBUTTONUP =>
               Basic_GUI.Update (Button_Array, E.Mouse.Position, 0);
            when others =>
               null;
            end case;
         end loop;
         Basic_GUI.Render (Renderer, Button_Array);
         Present (Renderer);
         delay 0.01;
      end loop;
      Destroy (Renderer);
   end;


   Home_SDL.Quit;


end Test_GUI;
