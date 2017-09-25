package Home_SDL.Geometry is

   type Integer_Element is new Interfaces.C.int;
   type Element_Count is new Interfaces.C.int;

   type Point_2D is record
      X : Integer_Element;
      Y : Integer_Element;
   end record with Pack => True, Convention => C;

   type Rectangle_2D is record
      X : Integer_Element;
      Y : Integer_Element;
      W : Integer_Element;
      H : Integer_Element;
   end record with Pack => True, Convention => C;

   type Integer_Array is array (Element_Count range <>) of aliased Integer_Element with Convention => C;

   type Point_Array is array (Element_Count range <>) of aliased Point_2D with Convention => C;

   type Rectangle_Array is array (Element_Count range <>) of aliased Rectangle_2D with Convention => C;

end Home_SDL.Geometry;
