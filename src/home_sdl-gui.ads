with Home_SDL.Geometry;
with Home_SDL.Colors;
with Home_SDL.Renderers;

package Home_SDL.GUI is

   use Home_SDL;

   type Basic_State is (Normal, Hoover, Active);
   type Background_Color_Mode is array (Basic_State) of Colors.Color_RGBA8888;


   type Basic_Background is record
      Normal : Colors.Color_RGBA8888;
      Hoover : Colors.Color_RGBA8888;
      Active : Colors.Color_RGBA8888;
      Toggle : Colors.Color_RGBA8888;
   end record;

   type Basic_Element is record
      Rectangle : Geometry.Rectangle_2D;
      Border_Color : Colors.Color_RGBA8888;
      Background : Basic_Background;
      Border : Boolean := False;
      Hoover : Boolean := False;
      Active : Boolean := False;
      Toggle : Boolean := False;
   end record;


   procedure Render (Renderer : Renderers.SDL_Renderer; Element : Basic_Element);
   procedure Update (Element : in out Basic_Element; Point : Geometry.Point_2D; B : Integer);


end Home_SDL.GUI;
