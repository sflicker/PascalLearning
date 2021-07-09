program quicksort;

{$MODE OBJFPC}

const ArraySize = 10000;
const Space = ' ';
const RandomRange = 1000000;

type
  IntArray = array [1..ArraySize] of integer;
  
var 
   arrayToSort: IntArray;
   numSwaps, numComparisons: Int64;

procedure swap(var x, y: integer);
var
  tmp: integer;

begin
  numSwaps := numSwaps + 1;
  tmp := x;
  x := y;
  y := tmp;
end;

procedure printArray(var anArray: IntArray);
var
  i : integer;
begin
  for i := Low(anArray) to High(anArray) do
    begin
      write(anArray[i] : 4);
      if i mod 10 = 0 then
	writeln;
    end;
end;

procedure initializeArray(var anArray: IntArray);
var
  i : integer;
begin
  for i := Low(anArray) to High(anArray) do
    anArray[i] := Random(RandomRange);

end;

function compareLE(lhs, rhs: Integer) : Boolean;
begin
  numComparisons := numComparisons + 1;
  compareLE := lhs <= rhs;
end;

function compareGT(lhs, rhs: Integer): Boolean;
begin
  numComparisons := numComparisons + 1;
  compareGT := lhs > rhs;
end;

function partition(var anArray: IntArray; low, high: Integer) : Integer;
var pi, first, last: Integer;
begin
  {* writeln('Paritioning with low=', low, ' and high=', high); *}
  pi := anArray[low];
  {* writeln('Setting Pivot to ', pi); *}
  first := low;
  last := high;
  while (first < last) do
  begin
    while (compareLE(anArray[first], pi)) do
      first += 1;
    while (compareGT(anArray[last], pi)) do
      last -= 1; 
    if (first < last) then
    begin
        {* writeln('Swapping ', anArray[first], ' with ' , anArray[last]); *}
        swap (anArray[first], anArray[last]);
        {* printArray(anArray); *}
    end;
  end;
  {* writeln('Swapping pivot ', anArray[low], ' with ' , anArray[last]); *}
  swap(anArray[low], anArray[last]);
  {* printArray(anArray); *}
  partition := last;
end;

procedure quickSort(var anArray: IntArray; low, high: Integer);
  var pi : integer;
begin
  if (low < high) then
  begin
    pi := partition(anArray, low, high);
    quickSort(anArray, low, pi - 1);
    quickSort(anArray, pi + 1, high);
  end;
end;

begin
  Randomize;  

  initializeArray(arrayToSort);
  numSwaps := 0;
  numComparisons := 0;
  writeln('Array Before Sort');

  printArray(arrayToSort);

  quickSort(arrayToSort, Low(arrayToSort), High(arrayToSort));
  writeln;
  writeln('Array After Sort');
  printArray(arrayToSort);
  writeln('Number of Swaps: ', numSwaps, ', Number of Comparisons: ', numComparisons);
end.