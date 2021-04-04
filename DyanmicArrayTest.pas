program DynamicArrayTest;
const
  ArrayInc = 10;  

var
  a : array of Integer;
  i : integer;
  len : integer;
  prevLen : integer;

begin
  len := ArrayInc;
  prevLen := len;

  setLength(a, len);

  for i := 0 to (len - 1) do
    a[i] := i;

  len := len + ArrayInc;
  setLength(a, len);

  for i := prevLen to (len -1) do
    a[i] := i;

  for i := 0 to (len - 1) do
    writeln(a[i]);
end.
