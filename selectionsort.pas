program SelectionSort;

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

procedure initializeArray(var anArray: IntArray);
var
  i : integer;
begin
  for i := Low(anArray) to High(anArray) do
    anArray[i] := Random(RandomRange);

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

procedure sort(var anArray: IntArray; var numSwaps: Int64; var numComparisons: Int64);
var i, j, minIndex, tmp : Integer;
begin
  numSwaps := 0;
  numComparisons := 0;
  {* main loop over array *}
  {* as calculation progression elements with index less than i *}
  {* will be parted of the sortted section. *}
  for i := Low(anArray) to High(AnArray) - 1 do
  begin
    {* find min for unsortted section *}
    minIndex := i;
    for j := i + 1 to High(anArray) do
    begin
      numComparisons := numComparisons + 1;
      if compare(anArray[minIndex], anArray[j], numComparisons) then
        minIndex := j;
    end;

    {* swap if necessary *}
    if minIndex <> i then
    begin
      swap(anArray[i], anArray[minIndex], numSwaps);
    end;
    
  end
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