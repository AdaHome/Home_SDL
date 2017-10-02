with Home_SDL.Geometry;
with Home_SDL.Colors;
with Home_SDL.Renderers;

package Home_SDL.GUI is

   use Home_SDL;

   type Basic_Element is record
      Rectangle : Geometry.Rectangle_2D;
      Border_Color : Colors.Color_RGBA;
      Background_Color : Colors.Color_RGBA;
      Background_Color_Hoover : Colors.Color_RGBA;
      Border : Boolean;
      Hoover : Boolean;
      Active : Boolean;
   end record;


   procedure Render (Renderer : Renderers.SDL_Renderer; Element : Basic_Element);

   procedure Update (Element : in out Basic_Element; X : Geometry.Integer_Element; Y : Geometry.Integer_Element);
   procedure Update (Element : in out Basic_Element; Point : Geometry.Point_2D);

   procedure Set_Pos
     (Element : in out Basic_Element;
      Outline : Geometry.Rectangle_2D;
      Point : Geometry.Point_2D;
      R, C : Geometry.Integer_Element);

end Home_SDL.GUI;
