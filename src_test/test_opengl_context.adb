with Ada.Text_IO;

with Home_SDL;
with Home_SDL.Windows;
with Home_SDL.Events;
with Home_SDL.Events_Kind;
with Home_SDL.Errors;

procedure Test_OpenGL_Context is


   procedure Render (Window : Home_SDL.Windows.SDL_Window) is
   begin
      null;
   end Render;

   procedure Event_Loop (Should_Run : in out Boolean) is
      use Ada.Text_IO;
      use Home_SDL.Events;
      use Home_SDL.Events_Kind;
      Event : SDL_Event;
      Flag : Integer;
   begin
      loop
         Flag := Poll (Event);
         exit when Flag = 0;
         case Event.Kind is
            when SDL_QUIT =>
               Put_Line ("[Event] SDL_QUIT");
               Should_Run := False;
               exit;
            when others =>
               null;
         end case;
      end loop;
   end Event_Loop;


begin

   Home_SDL.Initialize (Home_SDL.Initialize_Flags.Video);

   declare
      use Home_SDL;
      use Home_SDL.Windows.Window_Flags;
      Window : Home_SDL.Windows.SDL_Window;
      Should_Run : Boolean := True;
      GL_Context : Home_SDL.Windows.OpenGL_Context;
   begin
      Window := Windows.Create ("Title", 0, 0, 500, 500, True, True, 0, Shown or Resizable or OpenGL);
      GL_Context := Windows.Create_OpenGL_Context (Window);
      while Should_Run loop
         Event_Loop (Should_Run);
         Render (Window);
         Windows.Swap (Window);
         delay 0.01;
      end loop;
      Windows.Delete_OpenGL_Context (GL_Context);
      Windows.Destroy (Window);
   exception
      when others =>
         raise Program_Error with Home_SDL.Errors.Get;
   end;

   Home_SDL.Quit;

end Test_OpenGL_Context;
