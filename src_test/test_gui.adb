with Ada.Text_IO;
with Home_SDL;

with Interfaces.C;
with Home_SDL.Windows;
with Home_SDL.Renderers;
with Home_SDL.Events;
with Home_SDL.Events_Kind;
with Home_SDL.GUI;

procedure Test_GUI is
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
      use Home_SDL.Events;
      use type Events_Kind.SDL_Event_Kind;
      Renderer : SDL_Renderer;
      Button : GUI.Basic_Element;
      E : SDL_Event;
      Should_Run : Boolean := True;
   begin
      Button.Rectangle := (0, 0, 100, 100);
      Button.Background_Color := (100, 100, 100, 255);
      Button.Background_Color_Hoover := (255, 255, 255, 255);
      Renderer := Create (Window, Renderer_Flags.Software);
      while Should_Run loop
         while Home_SDL.Events.Poll (E) = 1 loop
            if E.Kind = Events_Kind.SDL_MOUSEMOTION then
               --Put_Line ("Mouse motion" & E.Mouse1.Position.X'Image & " " & E.Mouse1.Position.Y'Image);
               --Put_Line ("Mouse motion" & E.Mouse1.Velocity.X'Image & " " & E.Mouse1.Velocity.Y'Image);
               GUI.Update (Button, E.Mouse.Position);
            end if;
            if E.Kind = Events_Kind.SDL_QUIT then
               Put_Line ("SDL_QUIT");
               Should_Run := False;
               exit;
            end if;
         end loop;
         GUI.Render (Renderer, Button);

         Present (Renderer);
      end loop;

      --delay 1.0;
      Destroy (Renderer);
   end;

   Destroy (Window);

   Ada.Text_IO.Put_Line ("Quit SDL");
   Home_SDL.Quit;

end Test_GUI;
