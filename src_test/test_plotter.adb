with Home_SDL;
with Home_SDL.Windows;
with Home_SDL.Renderers;
with Home_SDL.Geometry;

with Basic_Event_Loop;
with Basic_Plotters;

procedure Test_Plotter is

   Plot : Basic_Plotters.Simple_Plot := (Rectangle => (10, 10, 10, 10), others => <>);

   procedure Render
     (Renderer : Home_SDL.Renderers.SDL_Renderer) is
      use Home_SDL;
      Data : Geometry.Point_2D_Array := ((0, 0), (10, 10), (20, 10));
   begin
      Basic_Plotters.Draw (Renderer, Plot, Data);
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

end Test_Plotter;
