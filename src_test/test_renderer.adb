with Home_SDL;
with Home_SDL.Windows;
with Home_SDL.Renderers;
with Home_SDL.Drawings;

with Basic_Event_Loop;

procedure Test_Renderer is

   procedure Render
     (Renderer : Home_SDL.Renderers.SDL_Renderer) is
      use Home_SDL;
   begin
      Drawings.Set_Color (Renderer, (0, 0, 0, 255));
      Drawings.Clear (Renderer);
      Drawings.Set_Color (Renderer, (255, 255, 255, 255));
      Drawings.Fill_Rectangle (Renderer, (10, 10, 10, 10));
   end;

begin

   Home_SDL.Initialize (Home_SDL.Initialize_Flags.Video);

   declare
      use Home_SDL;
      use Home_SDL.Windows.Window_Flags;
      use Home_SDL.Renderers.Renderer_Flags;
      Window : Home_SDL.Windows.SDL_Window;
      Renderer : Renderers.SDL_Renderer;
      Should_Run : Boolean := True;
   begin
      Window := Windows.Create ("Title", 0, 0, 500, 500, True, True, 0, Shown or Resizable);
      Renderer := Renderers.Create (Window, Software);
      while Should_Run loop
         Basic_Event_Loop (Should_Run);
         Render (Renderer);
         Renderers.Present (Renderer);
         delay 0.01;
      end loop;
      Renderers.Destroy (Renderer);
      Windows.Destroy (Window);
   end;

   Home_SDL.Quit;

end Test_Renderer;
