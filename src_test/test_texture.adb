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

   procedure Chess
     (Pixmap : out Home_SDL.Colors.Color_RGBA8888_Array2) is
      use Home_SDL.Colors;
      Black : constant Color_RGBA8888 := (000, 000, 000, 255);
      White : constant Color_RGBA8888 := (255, 255, 255, 255);
      A : Boolean := True;
   begin
      for I in Pixmap'Range (1) loop
         A := not A;
         for J in Pixmap'Range (2) loop
            A := not A;
            Pixmap (I, J) := (if A then White else Black);
         end loop;
      end loop;
   end Chess;
   pragma Unreferenced (Chess);
   -- X0X0X
   -- 0X0X0


   procedure Update is new Home_SDL.Textures.Generic_Update
     (Integer,
      Home_SDL.Colors.Color_RGBA8888,
      Home_SDL.Colors.Color_RGBA8888_Array2);


   Pixmap : constant Home_SDL.Colors.Color_RGBA8888_Array2 (1 .. 2, 1 .. 3) :=
     (
      ((255, 000, 000, 255), (000, 255, 000, 255), (000, 000, 255, 255)),
      ((000, 000, 000, 255), (050, 050, 050, 255), (100, 100, 100, 255))
     );


   procedure Render
     (Renderer : Home_SDL.Renderers.SDL_Renderer;
      Texture : Home_SDL.Textures.SDL_Texture) is
      use Home_SDL.Renderers;
      use Home_SDL.Colors;
      use Home_SDL.Textures;
      use Home_SDL.Drawings;
      R : Home_SDL.Geometry.Rectangle_2D;
   begin
      --Chess (Pixmap);
      Set_Color (Renderer, (255, 200, 100, 0));
      Clear (Renderer);
      Update (Texture, null, Pixmap);
      Set_Render_Target (Renderer, Texture);
      R.X := 1;
      R.Y := 5;
      R.W := 1;
      R.H := 5;
      Set_Color (Renderer, (15, 200, 100, 255));
      Fill_Rectangle (Renderer, R);
      Set_Render_Target (Renderer, Null_Texture);
      Render_Copy (Renderer, Texture);
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
      Texture := Textures.Create (Renderer, Textures.ABGR8888, Textures.Target, Pixmap'Length (2), Pixmap'Length (1));
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
