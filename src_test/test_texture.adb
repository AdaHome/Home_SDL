with Ada.Text_IO;

with Home_SDL;
with Home_SDL.Windows;
with Home_SDL.Renderers;
with Home_SDL.Events;
with Home_SDL.Events_Kind;
with Home_SDL.Geometry;
with Home_SDL.Textures;
with Home_SDL.Drawings;
with Home_SDL.Colors;

procedure Test_Texture is

   Window : Home_SDL.Windows.SDL_Window;

   procedure Render
     (Renderer : Home_SDL.Renderers.SDL_Renderer;
      Texture : Home_SDL.Textures.SDL_Texture) is
      use Home_SDL.Renderers;
      use Home_SDL.Colors;
      use Home_SDL.Textures;
      Pixmap : aliased Color_RGBA8888_Array := ((255, 255, 255, 255), (0, 0, 0, 255), (0, 0, 0, 255), (255, 255, 255, 255));
   begin
      Update (Texture, Pixmap'Address, 2 * 4);
      --Set_Render_Target (Renderer, Texture);
      --Set_Color (Renderer, (255, 200, 100, 0));
      --Clear (Renderer);
      --Set_Color (Renderer, (15, 200, 100, 0));
      --R.X := 100;
      --R.X := 200;
      --R.W := 100;
      --R.H := 200;
      --Draw_Rectangle (Renderer, R);
      --Set_Render_Target (Renderer, Null_Texture);
      Render_Copy (Renderer, Texture);
   end;

begin

   Home_SDL.Initialize (Home_SDL.Initialize_Flags.Video);



   declare
      use Ada.Text_IO;
      use Home_SDL;
      use Home_SDL.Windows;
      use type Home_SDL.Windows.Window_Flags.Flag_Field;
   begin
      Put_Line ("Create SDL Window");
      Window := Windows.Create ("Title", 0, 0, 500, 500, True, True, 0, Window_Flags.Shown or Window_Flags.Resizable);
   end;

   declare
      use Ada.Text_IO;
      use Home_SDL;
      use Home_SDL.Renderers;
      use Home_SDL.Events;
      use Home_SDL.Events_Kind;
      use Home_SDL.Textures;
      use Home_SDL.Drawings;
      Renderer : SDL_Renderer;
      Event : SDL_Event;
      Should_Run : Boolean := True;
      R : Geometry.Rectangle_2D;
      Texture : SDL_Texture;
   begin
      Windows.Get_Rectangle (Window, R);
      Renderer := Renderers.Create (Window, Renderer_Flags.Software);
      Texture := Textures.Create (Renderer, Textures.ARGB8888, Textures.Target, 2, 2);

      while Should_Run loop
         while Home_SDL.Events.Poll (Event) = 1 loop

            case Event.Kind is

            when Events_Kind.SDL_QUIT =>
               Put_Line ("SDL_QUIT");
               Should_Run := False;
               exit;

            when others =>
               null;

            end case;

         end loop;

         Render (Renderer, Texture);

         Present (Renderer);
      end loop;

      --delay 1.0;
      Destroy (Renderer);
   end;


   Home_SDL.Windows.Destroy (Window);
   Home_SDL.Quit;

end Test_Texture;
