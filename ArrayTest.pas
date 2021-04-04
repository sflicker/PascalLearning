program ArrayTest;
var
   squares: array [1..10] of integer;
   sqrts: array [1..10] of Real;
   i : integer;
begin
   for i := 1 to 10 do
     begin
       squares[i] := i * i;
        sqrts[i] := Sqrt(i);
     end;
   for i := 1 to 10 do
     writeln(i: 2, ' ', squares[i]: 5, ' ', sqrts[i]: 7 : 4);
end.

