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


   procedure Render
     (Renderer : Home_SDL.Renderers.SDL_Renderer;
      Texture : Home_SDL.Textures.SDL_Texture) is
      use Home_SDL.Renderers;
      use Home_SDL.Colors;
      use Home_SDL.Textures;
      use Home_SDL.Drawings;
      R : Home_SDL.Geometry.Rectangle_2D;
      Pixmap : aliased Color_RGBA8888_Array
        := (
            (255, 255, 255, 255), (000, 000, 000, 255),
            (000, 000, 000, 255), (255, 255, 255, 255)
           );
   begin
      Set_Color (Renderer, (255, 200, 100, 0));
      Clear (Renderer);
      Update (Texture, Pixmap'Address, 2 * 4);
      Render_Copy (Renderer, Texture);
      --Set_Render_Target (Renderer, Texture);
      --Set_Color (Renderer, (15, 200, 100, 0));
      --Set_Render_Target (Renderer, Null_Texture);
      R.X := 100;
      R.Y := 200;
      R.W := 100;
      R.H := 200;
      Set_Color (Renderer, (15, 200, 100, 255));
      Fill_Rectangle (Renderer, R);
   end;


   procedure Main_Loop
     (Renderer : Home_SDL.Renderers.SDL_Renderer;
      Texture : Home_SDL.Textures.SDL_Texture;
      Should_Run : in out Boolean) is
      use Home_SDL.Renderers;
      use Home_SDL.Events;
      use Home_SDL.Events_Kind;
      use Ada.Text_IO;
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
      Render (Renderer, Texture);
      Present (Renderer);
   end Main_Loop;


begin

   Home_SDL.Initialize (Home_SDL.Initialize_Flags.Video);

   declare
      use Home_SDL;
      use Home_SDL.Renderers;
      use Home_SDL.Textures;
      use Home_SDL.Windows;
      use Ada.Text_IO;
      use type Home_SDL.Windows.Window_Flags.Flag_Field;
      Window : Home_SDL.Windows.SDL_Window;
      Renderer : SDL_Renderer;
      R : Geometry.Rectangle_2D;
      Texture : SDL_Texture;
      Should_Run : Boolean := True;
   begin
      Window := Windows.Create ("Title", 0, 0, 500, 500, True, True, 0, Window_Flags.Shown or Window_Flags.Resizable);
      Windows.Get_Rectangle (Window, R);
      Renderer := Renderers.Create (Window, Renderer_Flags.Software);
      Texture := Textures.Create (Renderer, Textures.ARGB8888, Textures.Target, 2, 2);
      while Should_Run loop
         Main_Loop (Renderer, Texture, Should_Run);
         delay 0.01;
      end loop;
      Textures.Destroy (Texture);
      Renderers.Destroy (Renderer);
      Windows.Destroy (Window);
   end;

   Home_SDL.Quit;

end Test_Texture;
