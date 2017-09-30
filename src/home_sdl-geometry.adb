package body Home_SDL.Geometry is

   function XY_In_Rectangle (X : Integer_Element; Y : Integer_Element; R : Rectangle_2D) return Boolean is
      subtype XW is Integer_Element range R.X .. R.X + R.W;
      subtype YH is Integer_Element range R.Y .. R.Y + R.H;
   begin
      return X in XW and Y in YH;
   end;

   function Point_In_Rectangle (Point : Point_2D; R : Rectangle_2D) return Boolean is
      subtype XW is Integer_Element range R.X .. R.X + R.W;
      subtype YH is Integer_Element range R.Y .. R.Y + R.H;
   begin
      return Point.X in XW and Point.Y in YH;
   end;

end Home_SDL.Geometry;
