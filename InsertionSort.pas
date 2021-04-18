program InsertionSort;

{$MODE OBJFPC}

const arraySize = 10000;
const RandomRange = 1000000;

Type
    IntArray = array [1..arraySize] of integer;
var 
   arrayToSort: IntArray;
   numSwaps, numComparisons: Int64;

procedure printArray(var anArray: IntArray);
var
  i : integer;
begin
  for i := Low(anArray) to High(anArray) do
    begin
      write(anArray[i] : 7);
      if i mod 10 = 0 then
	writeln;
    end;
end;

procedure swap(var x, y: integer; var numSwaps : Int64);
var
  tmp: integer;

begin
  numSwaps := numSwaps + 1;
  tmp := x;
  x := y;
  y := tmp;
end;

function compare(x : Integer; y: Integer; var numComparisons: Int64): Boolean;
begin
  numComparisons := numComparisons + 1;
  compare := x > y;
end;

procedure sort(var anArray: IntArray;var numSwaps: Int64;var numComparisons: Int64);
var
  i, j : integer;
begin
  numSwaps := 0;
  numComparisons := 0;
  i := Low(anArray)+1;
  while i <= High(anArray) do
    begin
      j := i;
      while (j > 1) and (compare(anArray[j-1], anArray[j], numComparisons)) do
        begin
          swap(anArray[j], anArray[j-1], numSwaps);     
          j := j - 1;
        end;
      i := i + 1;
    end;
end;

procedure initializeArray(var anArray: IntArray);
var
  i : integer;
begin
  for i := Low(anArray) to High(anArray) do
    anArray[i] := Random(RandomRange);

end;

begin
  Randomize;

  initializeArray(arrayToSort);
  writeln('Array Before Sort');

  printArray(arrayToSort);

  writeln;
  writeln('Array After Sort');
  sort(arrayToSort, numSwaps, numComparisons);
  printArray(arrayToSort);
  writeln('Number of Swaps: ', numSwaps, ', Number of Comparisons: ', numComparisons);
end.