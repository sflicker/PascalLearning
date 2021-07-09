program TypeTest;
var i : integer;
    x, y : real;
begin
  i := 10;
  x := i;
  y := x * x;
  i := round(y);
  writeln(i:5,x:7:2,y:7:2);
end.