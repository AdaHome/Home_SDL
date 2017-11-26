with Ada.Assertions;
with Home_SDL.Errors;

package body Home_SDL.Textures is


   procedure Set_Render_Target
     (Renderer : in Renderers.SDL_Renderer;
      Texture  : in SDL_Texture) is
      use Ada.Assertions;
      I : Integer;
   begin
      I := Set_Render_Target (Renderer, Texture);
      Assert (I = 0, "Create() : " & Errors.Get);
   end;


   procedure Render_Copy
     (Renderer    : in Renderers.SDL_Renderer;
      Texture     : in SDL_Texture) is
      use Ada.Assertions;
      I : Integer;
   begin
      I := Render_Copy (Renderer, Texture, null, null);
      Assert (I = 0, "Update() : " & Errors.Get);
   end;


   procedure Update
     (Texture : in SDL_Texture;
      Data    : System.Address;
      Pitch   : Pitch8) is
      use Ada.Assertions;
      use type Interfaces.C.int;
      I : Interfaces.C.int;
   begin
      I := Update (Texture, null, Data, Pitch);
      Assert (I = 0, "Update() : " & Errors.Get);
   end;

end Home_SDL.Textures;
