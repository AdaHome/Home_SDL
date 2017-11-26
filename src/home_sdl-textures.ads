with Home_SDL.Renderers;
with Home_SDL.Geometry;
with System;

package Home_SDL.Textures is

   type Texture_Kind is (Static, Streaming, Target) with
     Convention => C;

   type SDL_Texture is private;

   Null_Texture : constant SDL_Texture;

   type Texture_Width is new Interfaces.C.int range 0 .. Interfaces.C.int'Last;
   type Texture_Height is new Interfaces.C.int range 0 .. Interfaces.C.int'Last;

   type Texture_Format is
     (
      INDEX1LSB,
      INDEX1MSB,
      INDEX4LSB,
      INDEX4MSB,
      INDEX8,
      RGB332,
      RGB444,
      RGB555,
      RGB565,
      ARGB4444,
      ARGB1555,
      RGBA4444,
      RGBA5551,
      BGR555,
      BGR565,
      ABGR4444,
      ABGR1555,
      BGRA4444,
      BGRA5551,
      RGB888,
      RGBX8888,
      ARGB8888,
      ARGB2101010,
      RGBA8888,
      BGR888,
      BGRX8888,
      ABGR8888,
      BGRA8888,
      RGB24,
      BGR24,
      NV21,
      NV12,
      YV12,
      YUY2,
      YVYU,
      IYUV,
      UYVY
     );

   subtype Source_Rectangle is Geometry.Rectangle_2D;
   subtype Destination_Rectangle is Geometry.Rectangle_2D;

   type Pitch8 is new Interfaces.C.int;

   function Set_Render_Target
     (Renderer : in Renderers.SDL_Renderer;
      Texture  : in SDL_Texture) return Integer with
     Import => True,
     Convention => C,
     External_Name => "SDL_SetRenderTarget";

   procedure Set_Render_Target
     (Renderer : in Renderers.SDL_Renderer;
      Texture  : in SDL_Texture);

   function Render_Copy
     (Renderer    : in Renderers.SDL_Renderer;
      Texture     : in SDL_Texture;
      Source      : access Source_Rectangle;
      Destination : access Destination_Rectangle) return Integer with
     Import => True,
     Convention => C,
     External_Name => "SDL_RenderCopy";

   procedure Render_Copy
     (Renderer    : in Renderers.SDL_Renderer;
      Texture     : in SDL_Texture);

   function Create
     (Renderer : in Renderers.SDL_Renderer;
      Format   : in Texture_Format;
      Kind     : in Texture_Kind;
      Width    : Texture_Width;
      Height   : Texture_Height) return SDL_Texture with
     Import        => True,
     Convention    => C,
     External_Name => "SDL_CreateTexture";


   function Update
     (Texture : in SDL_Texture;
      Format  : access Geometry.Rectangle_2D;
      Data    : System.Address;
      Pitch   : Pitch8) return Interfaces.C.int with
     Import        => True,
     Convention    => C,
     External_Name => "SDL_UpdateTexture";

   procedure Update
     (Texture : in SDL_Texture;
      Data    : System.Address;
      Pitch   : Pitch8);

private

   type SDL_Texture is new System.Address;
   Null_Texture : constant SDL_Texture := SDL_Texture (System.Null_Address);

   for Texture_Format'Size use 32;
   for Texture_Format use
     (
      INDEX1LSB => 16#11100100#,
      INDEX1MSB => 16#11200100#,
      INDEX4LSB => 16#12100400#,
      INDEX4MSB => 16#12200400#,
      INDEX8 => 16#13000801#,
      RGB332 => 16#14110801#,
      RGB444 => 16#15120C02#,
      RGB555 => 16#15130F02#,
      RGB565 => 16#15151002#,
      ARGB4444 => 16#15321002#,
      ARGB1555 => 16#15331002#,
      RGBA4444 => 16#15421002#,
      RGBA5551 => 16#15441002#,
      BGR555 => 16#15530F02#,
      BGR565 => 16#15551002#,
      ABGR4444 => 16#15721002#,
      ABGR1555 => 16#15731002#,
      BGRA4444 => 16#15821002#,
      BGRA5551 => 16#15841002#,
      RGB888 => 16#16161804#,
      RGBX8888 => 16#16261804#,
      ARGB8888 => 16#16362004#,
      ARGB2101010 => 16#16372004#,
      RGBA8888 => 16#16462004#,
      BGR888 => 16#16561804#,
      BGRX8888 => 16#16661804#,
      ABGR8888 => 16#16762004#,
      BGRA8888 => 16#16862004#,
      RGB24 => 16#17101803#,
      BGR24 => 16#17401803#,
      NV21 => 16#3132564E#,
      NV12 => 16#3231564E#,
      YV12 => 16#32315659#,
      YUY2 => 16#32595559#,
      YVYU => 16#55595659#,
      IYUV => 16#56555949#,
      UYVY => 16#59565955#
     );


end Home_SDL.Textures;
